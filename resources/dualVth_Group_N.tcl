proc dualVth {slackThreshold maxFanoutEndpointCost} {
    swap_to_hvt
    while {[check_constraints $slackThreshold max FanoutEndpointCost] == 0}{
        set hvt_cells [get_cells -filter "lib.cell.threshold_voltage_group == H] -- H?
        set random_cell [index_collection $hvt_cells]
        set cell_name [lindex $sorted_cells 0 0]
        swap_cell_to_lvt [get_cells $cell_name]     
    }
    return 1
}
proc swap_to_hvt {} {
    foreach_in_collection cell {get_cells}{
        set ref_name [get_attribute $cell ref_name]
        set library_name "CORE65LPHVT"
        regsub {_LL} $ref_name "_LH" new_ref_name
        size_cell $cell "${library_name}/${new_ref_name}"
    }
}
proc swap_cell_to_lvt {cell} {
    set ref_name [get_attribute $cell ref_name]
    set library_name "CORE65LPHVT"
    regsub {_LH} $ref_name "_LL" new_ref_name
    size_cell $cell "${library_name}/${new_ref_name}"
}
proc check constraints {slackThreshold maxFanoutEndpointCost} {
    update_timing -full
    set msc_slack {get_attribute [get_timing_paths]} --non sicuro 
    if {$msc_slack <0}{
        puts "Slack: $msc_slack"
        return 0
    }
    foreach_in_collection cell {get_cells}{
        set path [get_timing_paths -through $cell -nworst 1 -max_paths 10000] -- NON SO SE COMPLETO
        set cell_fanout_endpoint_cost 0.0
        foreach_in_collection path $paths {
            set this cost [expr $slackThreshold - [ get attribute $path slack ]] 
            set cell_fanout_endpoint_cost [expr $cell_fanout_endpoint_cost + ...] -- PROBLEMA
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
proc sort_cells_by_slack {hvt_cells} {
     foreach_in_collection cell $hct_cells {
        set cell_path [get_timing_paths -through $cell]
        set cell_slack [get_attribute $cell_path slack]
        set cell_name [get_attribute $cell full_name]
        lappend sorted_cells "$cell_name $cell_slack"
     }
     set $sorted_cells [lsort -real -index 1 $sorted_cells]
     return $sorted_cells
}