function sub_job_change(new, old)
    send_command(
		"wait 10; \
		input /lockstyleset 1"
	)
end

send_command(
	"wait 2; \
	input /lockstyleset 1"
)