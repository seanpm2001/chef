name "thorn-03"
description "Master role applied to thorn-03"

default_attributes(
  :networking => {
    :interfaces => {
      :internal_ipv4 => {
        :interface => "bond0",
        :role => :internal,
        :family => :inet,
        :address => "10.0.48.53",
        :bond => {
          :slaves => %w[eth0 eth1]
        }
      }
    }
  },
  :sysctl => {
    :ipv6_autoconf => {
      :comment => "Disable IPv6 auto-configuration on internal interface",
      :parameters => {
        "net.ipv6.conf.eth0.autoconf" => "0",
        "net.ipv6.conf.eth0.accept_ra" => "0"
      }
    }
  }
)

run_list(
  "role[ic]",
  "role[web-backend]"
)
