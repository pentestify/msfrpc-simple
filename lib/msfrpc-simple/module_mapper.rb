module Msf
  module RPC
    module Simple
      module ModuleMapper 
          
          # Public: Get all discovery modules, given a host endpoint
          #
          #  This method may seem poorly abstracted but you must pass in an IP address
          #  in order to compensate for the different ways that modules accept an
          #  endpoint. For example, scanners need an RHOSTS option, while most other 
          #  modules will accept a RHOST option.
          #
          # Returns a list of hashes, each one containing:
          #  [
          #  { :ip_address, 
          #    :port_num,
          #    :protocol,
          #    :transport,
          #    :modules_and_options => [ { :module_name, :module_option_string }, ...],
          #  }, ...
          #  ]
          def self.get_discovery_modules_for_endpoints(endpoints)
            #
            # Iterate through the endpoints, assigning modules
            #
            endpoints_with_modules = []
            endpoints.each do |endpoint|
              endpoints_with_modules << get_discovery_modules_for_endpoint(endpoint)
            end

          endpoints_with_modules
          end

          # Public: Returns all discovery modules for a singular endpoint
          #
          # An endpoint looks like: 
          #
          # { :ip_address, 
          #    :port_num,
          #    :protocol,
          #    :transport,
          #    :modules_and_options => [ { :module_name, :module_option_string }, ...],
          #  }
          #
          # Returns the endpoint object
          def self.get_discovery_modules_for_endpoint(endpoint)
              
            # If we have an unknown protocol, fall back to guessing by port
            endpoint[:protocol] = get_protocol_by_port_num(endpoint) unless endpoint[:protocol]
        
            # Start out with an empty modules_and_options array
            endpoint[:modules_and_options] = []

            # Now iterate through our protocols, assigning modules & optionss
            #
            # FTP
            #
            if endpoint[:protocol] == "FTP"
              endpoint[:modules_and_options] << {
                :module_name => "auxiliary/scanner/ftp/ftp_version",
                :module_option_string => "RHOSTS #{endpoint[:ip_address]}, RPORT #{endpoint[:port_num]}" }
            #
            # TELNET
            #
            elsif endpoint[:protocol] == "TELNET"
              endpoint[:modules_and_options] << {
                :module_name => "auxiliary/scanner/telnet/telnet_version",
                :module_option_string => "RHOSTS #{endpoint[:ip_address]}, RPORT #{endpoint[:port_num]}" }
            #
            # HTTP
            #
            elsif endpoint[:protocol] == "HTTP"
              endpoint[:modules_and_options] << {
                :module_name => "auxiliary/scanner/http/http_version",
                :module_option_string => "RHOSTS #{endpoint[:ip_address]}, RPORT #{endpoint[:port_num]}" }
            #
            # SNMP
            #
            elsif endpoint[:protocol] == "SNMP"
              endpoint[:modules_and_options] << {
                :module_name => "auxiliary/scanner/snmp/snmp_enum",
                :module_option_string => "RHOSTS #{endpoint[:ip_address]}, RPORT #{endpoint[:port_num]}" }
              
              endpoint[:modules_and_options] << {
                :module_name => "auxiliary/scanner/snmp/snmp_enumshares",
                :module_option_string => "RHOSTS #{endpoint[:ip_address]}, RPORT #{endpoint[:port_num]}" }
            
              endpoint[:modules_and_options] << {
                :module_name => "auxiliary/scanner/snmp/snmp_enumusers",
                :module_option_string => "RHOSTS #{endpoint[:ip_address]}, RPORT #{endpoint[:port_num]}" }

            #
            # HTTPS
            #
            elsif endpoint[:protocol] == "HTTPS"
              endpoint[:modules_and_options] << {
                :module_name => "auxiliary/scanner/http/http_version",
                :module_option_string => "RHOSTS #{endpoint[:ip_address]}, RPORT #{endpoint[:port_num]}" }
              
              endpoint[:modules_and_options] << {
                :module_name => "auxiliary/scanner/http/cert",
                :module_option_string => "RHOSTS #{endpoint[:ip_address]}, RPORT #{endpoint[:port_num]}" }
            #
            # Unknown protocol
            #
            else
              
            end

          # Return the modified endpoint
          endpoint
          end


          # Public: Returns a guessed protocol based on transport and port num
          #
          # Returns a protocol (string)
          def self.get_protocol_by_port_num(endpoint)
            #return endpoint[:protocol] unless endpoint[:protocol] == nil

            protocol = nil
            if endpoint[:transport] == "TCP"
              if endpoint[:port_num] == 21
                protocol = "FTP"
              elsif endpoint[:port_num] == 23
                protocol = "TELNET"
              elsif endpoint[:port_num] == 80
                protocol = "HTTP"
              elsif endpoint[:port_num] == 443
                protocol = "HTTPS"
              elsif endpoint[:port_num] == 8080
                protocol = "HTTP"
              end
            elsif endpoint[:transport] == "UDP"
              if endpoint[:port_num] == 161
                protocol = "SNMP"
              end
            else
              raise "Unknown Transport"
            end

          protocol
          end


      end
    end
  end
end