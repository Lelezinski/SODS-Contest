proc swap_to_hvt {} {
    foreach_in_collection cell [get_cells] {
        set ref_name [get_attribute $cell ref_name]

        set library_name "CORE65LPHVT"
        regsub {_LL} $ref_name "_LH" new_ref_name
        size_cell $cell "${library_name}/${new_ref_name}"
    }
}

proc swap_cell_to_lvt {cell} {
    set ref_name [get_attribute $cell ref_name]
    set library_name "CORE65LPLVT"
    regsub {_LH} $ref_name "_LL" new_ref_name
    size_cell $cell "${library_name}/${new_ref_name}"
}

proc swap_cell_to_hvt {cell} {
    set ref_name [get_attribute $cell ref_name]
    set library_name "CORE65LPHVT"
    regsub {_LL} $ref_name "_LH" new_ref_name
    size_cell $cell "${library_name}/${new_ref_name}"
}

proc check_contest_constraints {slackThreshold maxFanoutEndpointCost} {
    update_timing -full

    # Check Slack
    set msc_slack [get_attribute [get_timing_paths] slack]

    if {$msc_slack < 0} {
        puts "Slack: $msc_slack"
        return 0
    }

    # Check Fanout Endpoint Cost
    foreach_in_collection cell [get_cells] {
        set paths [get_timing_paths -through $cell -nworst 1 -max_paths 10000 -slack_lesser_than $slackThreshold]
        set cell_fanout_endpoint_cost 0.0
        foreach_in_collection path $paths {
            set this_cost [expr $slackThreshold - [get_attribute $path slack]]
            set cell_fanout_endpoint_cost [expr $cell_fanout_endpoint_cost + $this_cost]
        }

        if {$cell_fanout_endpoint_cost >= $maxFanoutEndpointCost} {
            puts "FCE Violated: $cell_fanout_endpoint_cost"
            set cell_name [get_attribute $cell full_name]
            set cell_ref_name [get_attribute $cell ref_name]
            return 0
        }
    }

    puts "Slack: $msc_slack"
    return 1
}

proc sort_cells_by_slack {cells} {
    set sorted_cells ""

    foreach_in_collection cell $cells {
        set cell_path [get_timing_paths -through $cell]
        set cell_slack [get_attribute $cell_path slack]
        set cell_name [get_attribute $cell full_name]
        lappend sorted_cells "$cell_name $cell_slack"
    }

    set sorted_cells [lsort -real -increasing -index 1 $sorted_cells]

    return $sorted_cells
}

proc sort_cells_by_leakage {cells} {
    set sorted_cells ""

    foreach_in_collection cell $cells {
        set cell_leakage [get_attribute $cell leakage_power]
        set cell_name [get_attribute $cell full_name]
        lappend sorted_cells "$cell_name $cell_leakage"
    }

    set sorted_cells [lsort -real -increasing -index 1 $sorted_cells]

    return $sorted_cells
}

proc sort_cells_by_slack_by_leakage {cells} {
    set sorted_cells ""

    foreach_in_collection cell $cells {
        set cell_name [get_attribute $cell full_name]
        #leakage
        set cell_leakage [get_attribute $cell leakage_power]
        #slack
        set cell_path [get_timing_paths -through $cell]
        set cell_slack [get_attribute $cell_path slack]
        set slack_leak_prod [expr {$cell_leakage * $cell_slack}]

        lappend sorted_cells "$cell_name $slack_leak_prod"
    }

    set sorted_cells [lsort -real -increasing -index 1 $sorted_cells]
    return $sorted_cells
}


# V3
proc dualVth {slackThreshold maxFanoutEndpointCost} {
    # Initially swap all to HVT
    swap_to_hvt

    puts "## First swap to LVT"

    # First swap to LVT to meet slack
    while {[check_contest_constraints $slackThreshold $maxFanoutEndpointCost] == 0} {
        set hvt_cells [get_cells -filter "lib_cell.threshold_voltage_group == HVT"]
        # SORT CELLS
        set sorted_cells [sort_cells_by_slack_by_leakage $hvt_cells]
        set num_cells_to_swap [expr {int([llength $sorted_cells] / 2)}]

        # Swap half of the cells to LVT
        for {set i 0} {$i < $num_cells_to_swap} {incr i} {
            set cell_name [lindex $sorted_cells $i 0]
            swap_cell_to_lvt [get_cells $cell_name]
        }
    }

    puts "## Try to swap back to HVT"

    # While still possible, swap back to HVT to lower power consumption
    while {[check_contest_constraints $slackThreshold $maxFanoutEndpointCost] == 1} {
        set lvt_cells [get_cells -filter "lib_cell.threshold_voltage_group == LVT"]
        # SORT CELLS
        set sorted_cells [sort_cells_by_slack_by_leakage $lvt_cells]
        set num_cells [llength $sorted_cells]
        set num_cells_to_swap 2
        set start_index [expr {$num_cells - $num_cells_to_swap}]

        # Swap higher half of the cells to HVT
        for {set i $start_index} {$i < $num_cells} {incr i} {
            set cell_name [lindex $sorted_cells $i 0]
            swap_cell_to_hvt [get_cells $cell_name]
        }
    }

    puts "## Go back to last working point"

    # Go back to last working point
    for {set i $start_index} {$i < $num_cells} {incr i} {
        set cell_name [lindex $sorted_cells $i 0]
        swap_cell_to_lvt [get_cells $cell_name]
    }

    if {[check_contest_constraints $slackThreshold $maxFanoutEndpointCost] == 1} {
        return 1
    }
    else {
        puts "ERROR"
        return 0 
    }
}