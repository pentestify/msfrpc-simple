module MsfRpc
  module Simple
    module Features 
      module Pro

        def start_report(options)
          raise "Unimplemented"
=begin
          task = @rpc.call("pro.start_report", {
            'DS_REPORT_TYPE'            => options[:report_type],
            'DS_WHITELIST_HOSTS'        => options[:whitelist],
            'DS_BLACKLIST_HOSTS'        => options[:blacklist],
            'workspace'                 => options[:workspace],
            'username'                  => options[:username],
            'DS_MaskPasswords'          => options[:ds_mask_passwords] || true,
            'DS_IncludeTaskLog'         => options[:include_task_log] || true,
            'DS_JasperDisplaySession'   => options[:ds_jasper_display_session] || false,
            'DS_JasperDisplayCharts'    => options[:ds_mask_passwords] || true,
            'DS_LootExcludeScreenshots' => options[:ds_loot_exclude_screenshots] || false,
            'DS_LootExcludePasswords'   => options[:ds_loot_exclude_passwords] || false,
            'DS_JasperTemplate'         => options[:ds_jasper_template] || "msfxv3.jrxml",
            'DS_UseJasper'              => options[:ds_use_jasper]] ||true,
            'DS_UseCustomReporting'     => options[:ds_use_custom_reporting] || false,
            'DS_JasperProductName'      => options[:ds_jasper_product_name] || "Metasploit Pro",
            'DS_JasperDbEnv'            => options[:ds_jasper_db_env] || "production",
            'DS_JasperLogo'             => options[:ds_jasper_logo] || "",
            'DS_JasperDisplaySections'  => options[:ds_jasper_display_sections] || "1,2,3,4,5,6,7,8",
            'DS_EnablePCIReport'        => options[:ds_enable_pci_report] || true,
            'DS_EnableFISMAReport'      => options[:ds_enable_fisma_report] || true,
            'DS_JasperDisplayWeb'       => options[:ds_enable_jasper_display_web] || true,
          })
=end
        end

        def start_discover(options)
          raise "Unimplemented"

          #task = @rpc.call("pro.start_discover", {
          #  'DS_WHITELIST_HOSTS'        => options[:whitelist],
          #  'DS_BLACKLIST_HOSTS'        => options[:blacklist],
          #  'workspace'                 => options[:workspace],
          #  'username'                  => options[:username]
          #})
        end

        def start_bruteforce(options)
          raise "Unimplemented"
        end

      end
    end
  end
end

