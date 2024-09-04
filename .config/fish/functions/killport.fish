function killport
    if count $argv >/dev/null
        set port $argv[1]
        echo "Trying to kill process on port $port"

        set pid_list (lsof -t -i :$port)

        if count $pid_list >/dev/null
            for pid in $pid_list
                if kill $pid >/dev/null 2>&1
                    echo "Successfully killed process with PID $pid on port $port"
                else
                    echo "Failed to kill process with PID $pid"
                end
            end
        else
            echo "No processes are running on port $port"
        end
    else
        echo "Usage: killport <port>"
    end
end
