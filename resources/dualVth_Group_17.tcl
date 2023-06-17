proc dualVth {slackThreshold maxFanoutEndpointCost} {
    # Initially swap all cells to HVT
    swap_to_hvt

    while {[check_constraints $slackThreshold maxFanoutEndpointCost] == 0} {
        # While constraints are not met
        # Swap a random HVT cell at time to LVT
        set hvt_cells [get_cells -filter "lib.cell.threshold_voltage_group == HVT"]
        set random_cell [index_collection $hvt_cells]
        set cell_name [lindex $sorted_cells 0 0]
        swap_cell_to_lvt [get_cells $cell_name]
    }
    return 1
}

# Swap all cells to HVT
proc swap_to_hvt {} {
    foreach_in_collection cell {get_cells} {
        set ref_name [get_attribute $cell ref_name]
        set library_name "CORE65LPHVT"
        regsub {_LL} $ref_name "_LH" new_ref_name
        size_cell $cell "${library_name} / ${new_ref_name}"
    }
}

# Swap given cell to LVT
proc swap_cell_to_lvt {cell} {
    set ref_name [get_attribute $cell ref_name]
    set library_name "CORE65LPHVT"
    regsub {_LH} $ref_name "_LL" new_ref_name
    size_cell $cell "${library_name} / ${new_ref_name}"
}

# Check if constraints are met
proc check_constraints {slackThreshold maxFanoutEndpointCost} {
    update_timing -full
    # TODO: Marco non è sicuro della linea dopo
    set msc_slack {get_attribute [get_timing_paths]}

    if {$msc_slack < 0}{
        puts "Slack: $msc_slack"
        return 0
    }
    foreach_in_collection cell {get_cells}{
        # TODO: Marco non sa se è completo. marco non sa molte cose
        set path [get_timing_paths -through $cell -nworst 1 -max_paths 10000]
        set cell_fanout_endpoint_cost 0.0
        foreach_in_collection path $paths {
            set this cost [expr $slackThreshold - [ get attribute $path slack ]]
            # FIXME: completare linea dopo
            set cell_fanout_endpoint_cost [expr $cell_fanout_endpoint_cost + ...]
        }
        puts FCE: $cell_fanout_endpoint_cost
        if {$cell_fanout_endpoint_cost >= $maxFanoutEndpointCost}{
            set cell_name [get attribute $cell full_name]
            set cell_ref_name [get_attribute $cell ref_name]
            return 0
        }
    }
    return 1
}

# Cell sorting algorithm: ascending order by cell slack
proc sort_cells_by_slack {hvt_cells} {
    # Create the list to sort
    foreach_in_collection cell $hvt_cells {
        set cell_path [get_timing_paths -through $cell]
        set cell_slack [get_attribute $cell_path slack]
        set cell_name [get_attribute $cell full_name]
        lappend sorted_cells "$cell_name $cell_slack"
    }
    # Sort by ascending slack order
    set $sorted_cells [lsort -real -increasing -index 1 $sorted_cells]
    return $sorted_cells
}
