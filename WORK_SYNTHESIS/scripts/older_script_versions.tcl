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