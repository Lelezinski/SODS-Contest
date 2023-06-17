proc dualVth {slackThreshold maxFanoutEndpointCost} {
    # SIZE ALL TO HVT
    swap_to_hvt

    # WHILE TIMING CONSTRAINTS ARE NOT MET
    while {[check_contest_constraints $slackThreshold $maxFanoutEndpointCost] == 0} {
        set hvt_cells [get_cells -filter "lib_cell.threshold_voltage_group == HVT"]
        # SORT CELLS
        set sorted_cells [sort_cells_by_slack $hvt_cells]
        # SIZE FIRST CELLS FROM PREVIOUS LIST TO LVT
        set cell_name [lindex $sorted_cells 0 0]
        # SWAP the random_cell to LVT
        swap_cell_to_lvt [get_cells $cell_name]
    }

    return 1
}

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

    return 1
}

proc sort_cells_by_slack {hvt_cells} {
    set sorted_cells ""

    foreach_in_collection cell $hvt_cells {
        set cell_path [get_timing_paths -through $cell]
        set cell_slack [get_attribute $cell_path slack]
        set cell_name [get_attribute $cell full_name]
        lappend sorted_cells "$cell_name $cell_slack"
    }

    set sorted_cells [lsort -real -increasing -index 1 $sorted_cells]

    return $sorted_cells
}

