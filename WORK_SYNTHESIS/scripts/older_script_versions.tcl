## OLDER VERSIONS ##

# V1
proc dualVth_V1 {slackThreshold maxFanoutEndpointCost} {
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

# V2
proc dualVth_V2 {slackThreshold maxFanoutEndpointCost} {
    # SIZE ALL TO HVT
    swap_to_hvt

    # WHILE TIMING CONSTRAINTS ARE NOT MET
    while {[check_contest_constraints $slackThreshold $maxFanoutEndpointCost] == 0} {
        set hvt_cells [get_cells -filter "lib_cell.threshold_voltage_group == HVT"]
        # SORT CELLS
        set sorted_cells [sort_cells_by_slack $hvt_cells]
        set num_cells_to_swap [expr {int([llength $sorted_cells] / 2)}]

        # Swap half of the cells to LVT
        for {set i 0} {$i < $num_cells_to_swap} {incr i} {
            set cell_name [lindex $sorted_cells $i 0]
            swap_cell_to_lvt [get_cells $cell_name]
        }
    }

    return 1
}

# V3
proc dualVth_V3 {slackThreshold maxFanoutEndpointCost} {
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

# V3b
proc dualVth_V3b {slackThreshold maxFanoutEndpointCost} {
    # Swap all to HVT
    set cell_number [swap_to_hvt]

    # Set num_cells_to_swap
    set alpha 10
    set num_cells_to_swap [expr {$cell_number / $alpha}]

    puts "###"
    puts "# Total number of cells: $cell_number"
    puts "# Swapping $num_cells_to_swap cells each cycle."
    puts "###"

    set constraint_status 1

    # WHILE TIMING CONSTRAINTS ARE NOT MET
    while {1} {
        set hvt_cells [get_cells -filter "lib_cell.threshold_voltage_group == HVT"]
        # SORT CELLS
        set sorted_cells [sort_cells_by_slack $hvt_cells]
        #set num_cells_to_swap [expr {int([llength $sorted_cells] / 2)}]

        # Swap half of the cells to LVT
        for {set i 0} {$i < $num_cells_to_swap} {incr i} {
            set cell_name [lindex $sorted_cells $i 0]
            swap_cell_to_lvt [get_cells $cell_name]
        }

        set constraint_status [check_contest_constraints $slackThreshold $maxFanoutEndpointCost]
        if {$constraint_status == 0} {
            break
        } elseif {$constraint_status == 2} {
            # Fanout error, reset and halve num_cells_to_swap
            puts "# Fanout too high, resetting stage..."
            for {set i 0} {$i < $num_cells_to_swap} {incr i} {
                set cell_name [lindex $sorted_cells $i 0]
                swap_cell_to_hvt [get_cells $cell_name]
            }
            set num_cells_to_swap [expr {int($num_cells_to_swap / 2)}]
            puts "# Now swapping $num_cells_to_swap every cycle"

            if {$num_cells_to_swap < 2} {
                # Stuck, reset everything and change starting num_cells_to_swap 
                puts "# Fanout too high, resetting from the beginning..."
                set cell_number [swap_to_hvt]
                set num_cells_to_swap [expr {$cell_number / ($alpha * 5)}]
                puts "# Now swapping $num_cells_to_swap every cycle"
            }
        }
    }

    return 1
}

#V3c
proc dualVth_V3c {slackThreshold maxFanoutEndpointCost} {
    # Swap all to HVT
    set cell_number [swap_to_lvt]

    # Set num_cells_to_swap
    set alpha 10
    set max_cycles 10
    set num_cells_to_swap [expr {$cell_number / $alpha}]
    set cycle 0

    puts "###"
    puts "# Total number of cells: $cell_number"
    puts "# Swapping $num_cells_to_swap cells each cycle."
    puts "# Max number of cycles: $max_cycles."
    puts "###"

    set constraint_status 1

    # WHILE TIMING CONSTRAINTS ARE NOT MET
    while {1} {
        incr cycle
        puts "# Cycle $cycle"

        set lvt_cells [get_cells -filter "lib_cell.threshold_voltage_group == LVT"]
        # SORT CELLS
        set sorted_cells [sort_cells_by_slack_by_leakage_decreasing $lvt_cells]
        #set num_cells_to_swap [expr {int([llength $sorted_cells] / 2)}]

        # Swap half of the cells to LVT
        for {set i 0} {$i < $num_cells_to_swap} {incr i} {
            set cell_name [lindex $sorted_cells $i 0]
            swap_cell_to_hvt [get_cells $cell_name]
        }

        set constraint_status [check_contest_constraints $slackThreshold $maxFanoutEndpointCost]
        if {$constraint_status == 1} {
            # Reset
            for {set i 0} {$i < $num_cells_to_swap} {incr i} {
                set cell_name [lindex $sorted_cells $i 0]
                swap_cell_to_lvt [get_cells $cell_name]
            }
            # Halve number of num_cells_to_swap
            set num_cells_to_swap [expr {$num_cells_to_swap / 2}]
            puts "# Now swapping $num_cells_to_swap cells."
        } elseif {$constraint_status == 2} {
            # Fanout error, reset and halve num_cells_to_swap
            puts "# Fanout too high, going on..."
        } elseif {$cycle > $max_cycles} {
            puts "# Max cycles reached"
            break
        }
    }

    return 1
}

# paths
# WHILE TIMING CONSTRAINTS ARE NOT MET
while {[check_contest_constraints $slackThreshold $maxFanoutEndpointCost] > 0} {

    set paths [get_timing_paths -nworst $num_paths -max_paths $num_paths -slack_lesser_than $slackThreshold]
    foreach_in_collection path $paths {
        set listTimingPoints [get_attribute $path points]
        set cell_list ""

        foreach_in_collection timingPoint $listTimingPoints {
            set pin [get_attribute $timingPoint object]
            set cell [get_attribute $pin cell]
            lappend cell_list $cell
        }

        puts "sad"
        puts $cell_list
        
        # Order the cells of the path 
        set sorted_cells [sort_cells_by_slack_by_leakage_decreasing $cell_list]

        # Change to LVT num_cells_to_swap in the path
        for {set i 0} {$i < $num_cells_to_swap} {incr i} {
            set cell_name [lindex $sorted_cells $i 0]
            swap_cell_to_hvt [get_cells $cell_name]
        }
    }
}