jq is required locally
brew install jq graphviz
terraform graph |dot -Tpng > a.png   

check bootscript needed for debian

  http://devhub.scaleway.com/#/bootscripts
  http://devhub.scaleway.com/#/bootscripts/b5c5261e-176d-43bb-bbae-7c9f211cfce3
  http://devhub.scaleway.com/#/bootscripts/45c0d23a-bacb-400e-86d9-9b2fecbfb081

in main.tf

        data "scaleway_bootscript" "latest" {
          architecture = "x86_64"
          name_filter  = "4.10.8 std #1"
        }


http://www.terrafoundry.net/blog/2017/03/26/scaleway-terraform/
