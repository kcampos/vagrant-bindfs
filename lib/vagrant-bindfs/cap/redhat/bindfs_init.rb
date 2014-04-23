module VagrantPlugins
  module Bindfs
    module Cap
      module RedHat
        module BindfsInit

          def self.bindfs_init(machine)
            machine.communicate.tap do |comm|
              unless comm.test('ls /dev | grep fuse')
                comm.sudo('/sbin/modprobe fuse')
              end
            end
          end

        end # BindfsInit
      end # RedHat
    end # Cap
  end # Bindfs
end # VagrantPlugins