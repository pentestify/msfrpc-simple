module Msf
  module RPC
    module Simple
      module Features 
        module Framework

          #
          # This module runs a number of discovery modules
          #
          def discover_range(range)

            # Other Potential options
            #  - auxiliary/scanner/smb/pipe_auditor
            #  - auxiliary/scanner/smb/pipe_dcerpc_auditor
            #  - auxiliary/scanner/smb/smb_enumshares
            #  - auxiliary/scanner/smb/smb_enumusers
            modules_and_options = [ 
              {:module_name => "auxiliary/scanner/http/http_version", 
               :module_option_string => "RHOSTS #{range}" },
              #{:module_name => "auxiliary/scanner/http/cert", 
              # :module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/ftp/ftp_version",
              :module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/h323/h323_version",
              :module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/imap/imap_version",
              :module_option_string => "RHOSTS #{range}" },
              #{:module_name => "auxiliary/scanner/portscan/syn",
              #:module_option_string => "RHOSTS #{range}" },
              #{:module_name => "auxiliary/scanner/portscan/tcp",
              #:module_option_string => "RHOSTS #{range}" },
              #{:module_name => "auxiliary/scanner/lotus/lotus_domino_version",
              #:module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/mysql/mysql_version",
              :module_option_string => "RHOSTS #{range}" },
              #{:module_name => "auxiliary/scanner/netbios/nbname",
              #:module_option_string => "RHOSTS #{range}" },
              #{:module_name => "auxiliary/scanner/netbios/nbname_probe",
              #:module_option_string => "RHOSTS #{range}" },
              #{:module_name => "auxiliary/scanner/pcanywhere/pcanywhere_tcp",
              #:module_option_string => "RHOSTS #{range}" },
              #{:module_name => "auxiliary/scanner/pcanywhere/pcanywhere_udp",
              #:module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/pop3/pop3_version",
              :module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/postgres/postgres_version",
              :module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/smb/smb_version",
              :module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/snmp/snmp_enum",
              :module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/ssh/ssh_version",
              :module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/telnet/telnet_version",
              :module_option_string => "RHOSTS #{range}" },
              #{:module_name => "auxiliary/scanner/vmware/vmauthd_version",
              #:module_option_string => "RHOSTS #{range}" },
            ]

            # This is a naive and horrible way of doing it, but let's just knock 
            # out the basic thing first. For each module in our list... 
            module_output_data_string = ""
            modules_and_options.each do |module_and_options|

              module_name = module_and_options[:module_name]
              module_option_string = module_and_options[:module_option_string]

              # store this module's name in the output
              module_output_data_string += "=== #{module_name} #{module_option_string} ===\n"

              module_output_data_string += execute_module_and_return_output(module_and_options)
            end

          module_output_data_string
          end


          #
          # This module runs a number of _login modules
          #
          def bruteforce_range(range)

            modules_and_options = [
              {:module_name => "auxiliary/scanner/ftp/ftp_login", 
               :module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/http/http_login", 
               :module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/smb/smb_login", 
               :module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/mssql/mssql_login", 
               :module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/mysql/mysql_login", 
               :module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/pop3/pop3_login", 
               :module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/smb/smb_login", 
               :module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/snmp/snmp_login", 
               :module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/ssh/ssh_login", 
               :module_option_string => "RHOSTS #{range}" },
              {:module_name => "auxiliary/scanner/telnet/telnet_login", 
               :module_option_string => "RHOSTS #{range}" },
            ]

            # This is a naive and horrible way of doing it, but let's just knock 
            # out the basic thing first. For each module in our list... 
            module_output_data_string = ""
            modules_and_options.each do |module_and_options|

              module_name = module_and_options[:module_name]
              module_option_string = module_and_options[:module_option_string]

              # store this module's name in the output
              module_output_data_string += "=== #{module_name} #{module_option_string} ===\n"

              module_output_data_string += execute_module_and_return_output(module_and_options)
            end

          module_output_data_string

          end

          #
          # This module runs a number of exploit modules
          #
          def exploit_range(range)
            return "Not Implemented"
          end

          #
          # This module simply runs a module
          #
          def execute_module_and_return_output(options)
            module_name = options[:module_name]
            #module_options = options[:module_options]
            module_option_string = options[:module_option_string]

            # split up the module name into type / name
            module_type = module_name.split("/").first
            raise "Error, bad module name" unless ["exploit", "auxiliary", "post", "encoder", "nop"].include? module_type  
            
            #module_options["TARGET"] = 0 unless module_options["TARGET"]

            #info = @client.call("module.execute", module_type, module_name, module_options)
            #@client.call("job.info", info["job_id"])

            # The module output will be not available when run this way; to 
            # capture the result of the print_* commands, you have to set the
            # output driver of the module to something you can read from (Buffer,
            # File, etc). For your use case, the best bet is to run the module 
            # via the Console API instead of module.execute, and use that to read
            # the output from the console itself, which provides buffer output for you.

            # Create the console and get its id
            console = @client.call("console.create")
            console_id = console["id"]

            # Do an initial read / discard to pull out the banner
            @client.call("console.read", console_id)

            # Move to the context of our module
            @client.call("console.write", console_id, "use #{module_name}\n")

            # Set up the module's datastore
            module_option_string.split(",").each do |module_option|
              @client.call "console.write", console_id, "set #{module_option}\n"
              @client.call("console.read", console_id)
            end

            # Ugh, this is horrible, but the read call is currently racey
            5.times do 
              @client.call("console.read", console_id)
            end

            # Depending on the module_type, kick off the module
            if module_type == "auxiliary"
              @client.call "console.write", console_id, "run\n"
            elsif module_type == "exploit"
              @client.call "console.write", console_id, "exploit\n"
            else
              return "Unsupported"
            end

            # do an initial read of the module's output
            module_output = @client.call("console.read", console_id)
            module_output_data_string = "#{module_output['data']}"
          
            return "Module Error" if module_output["result"] == "failure"

            while module_output["busy"] do
              module_output = @client.call("console.read", console_id)
              module_output_data_string += "#{module_output['data']}"
              return "Module Error" if module_output["result"] == "failure"
            end

            # Ugh, this is horrible, but the read call is currently racey
            5.times do
              module_output = @client.call("console.read", console_id)
              module_output_data_string += "#{module_output['data']}"
            end

            # Clean up 
            @client.call("console.destroy", console_id)

          module_output_data_string
          end

        end
      end
    end
  end
end