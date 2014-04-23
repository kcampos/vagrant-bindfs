module VagrantPlugins
  module Bindfs
    module Cap
      module RedHat
        module BindfsInstall

          def self.bindfs_install(machine)
            machine.communicate.tap do |comm|
              if comm.test('uname -r | grep el5')
                unless comm.test('yum repolist | grep epel')
                  comm.sudo('wget -o /tmp/epel-release-5-4.noarch.rpm http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm && rpm -Uvh /tmp/epel-release-5-4.noarch.rpm')
                end
              end
              comm.sudo('yum -y install bindfs')
            end
          end

          def self.bindfs_init(machine)
            machine.communicate.tap do |comm|
              unless comm.test('ls /dev | grep fuse')
                comm.sudo('/sbin/modprobe fuse')
              end
            end
          end

        end # BindfsInstall
      end # RedHat
    end # Cap
  end # Bindfs
end # VagrantPlugins