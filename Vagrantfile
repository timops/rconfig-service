require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  # The path to the Berksfile to use with Vagrant Berkshelf
  config.berkshelf.berksfile_path = "./Berksfile"

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.only = []

  config.vm.define :master do |master_config|
    master_config.vm.host_name = "tftpd-server"
    master_config.vm.box = "opscode-ubuntu-12.04"
    master_config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-11.2.0.box"

    master_config.vm.network :hostonly, "172.16.65.200"
    master_config.ssh.max_tries = 40
    master_config.ssh.timeout   = 120
    master_config.ssh.forward_agent = true

    master_config.vm.provision :chef_client do |chef|
      chef.json = {
      }
      chef.chef_server_url = "https://api.opscode.com/organizations/persuse"

      chef.validation_client_name = "persuse-validator"
      chef.validation_key_path = "#{ENV['HOME']}/.chef/persuse-validator.pem"
      chef.client_key_path = "/etc/chef/client.pem"

      chef.run_list = [
        "recipe[rconfig-service]"
      ]
    end
  end
end
