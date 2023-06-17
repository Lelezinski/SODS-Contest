set simulation_period 5000
# Node			Tc     Ti	   Time At 1   Time At 0    Time at X
# /test/u0/key(121)      5     12           60          120         4820

set netName "n1167"
set toggle_count 4
set time_at_1 4725
set static_probability [expr $time_at_1 / $simulation_period]

set_switching_activity $net_name -static_probability $static_probability -toggle+rate $toggle_count 

update_power
report_power

set line {}
