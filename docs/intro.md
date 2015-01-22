# Cluster overview

The WWCRC has two identical [Dell GDAP clusters](http://www.dell.com/learn/us/en/555/hpcc/high-performance-computing-life-sciences),
named `cluster01` and `cluster02`.

Each cluster has:

* two master nodes (`master{01,02}` when working within the cluster,
  `hn{01..04}.tcrc.gla.ac.uk` when connected to the University of Glasgow
  VPN) in an active-standby failover pair
* two login nodes (`login{01,02}` when working within the cluster,
  `{c1l1,c1l2,c2l1,c2l2}.tcrc.gla.ac.uk` when connected to the University of
  Glasgow VPN)
* 32 compute blades (`node{01..32}` in the chassis `m1000e`)
* a large memory compute node (`fatnode01`)
* two NFS servers (`nfs{01,02}`) in an active-standby failover pair with a
  shared drive shelf
* a 10ge<->InfiniBand Lustre transfer gateway (`lustre-gateway`) to transfer
  files from Isilon storage to Lustre scratch storage
* a Lustre instance composed of:
** two metadata servers (`mds{01,02}`) in an active-standby failover pair
   with a shared drive shelf
** two object storage servers (`oss{01,02}`) in an active-standby failover
   pair with a shared drive shelf
** one Terascala monitoring server (`lustre-tms`) for managing and monitoring
   the Lustre filesystem and servers

The non-Lustre parts of the cluster are based on [Bright Cluster
Manager](http://www.brightcomputing.com/Bright-Cluster-Manager), which runs
[Slurm](http://schedmd.com/) for job management and runs an LDAP server so
all cluster hosts have access to the same accounts.

Each Lustre host only has its local accounts. This is especially relevant
for `lustre-gateway`, since someone must currently log into that host to
transfer files from Isilon storage to Lustre scratch.


# Connecting

First, [connect to the University of Glasgow
VPN](http://www.gla.ac.uk/services/it/flexaccess/vpn/offcampusaccess/). For
OS X, don't download the Cisco VPN client; the [built-in VPN
client](http://www.gla.ac.uk/services/it/flexaccess/vpn/helpadviceandsupport/installationandconnection/formacos106/)
is much easier to use. For Linux, use VPNC with this configuration:

```
IPSec gateway gucsvpn1.cent.gla.ac.uk
IPSec ID vpnstaff
IPSec secret [elided]
Xauth username WWCRCHPC
Xauth password [elided]
Interface name glasgow
Local Port 0
```

Once connected to the VPN, you can SSH to the login or master nodes. Once
logged into the master nodes, you can then SSH to all other (non-login,
non-master cluster nodes.

The master nodes host a [user portal](https://master.cm.cluster/userportal/)
that might be interesting to look at.

The cluster hosts some services that are only accessible by [using the proxy
service](proxy.md) on the master nodes:

* Dell DRAC management adapters for remote console/power control/etc.
* Terascala [management](http://lustre-tms.eth.cluster/) and
  [monitoring](http://lustre-tms.eth.cluster/index.php?m=1386757813)


# Managing the Cluster

You can manage the cluster on the command line using `cmsh` or with a
GUI using [cmgui](http://support.brightcomputing.com/cmgui-download/).
When adding clusters to cmgui, use the `hn*` hostnames to connect to
the cluster.


## Creating User Accounts

* In cmgui, choose `Users & Groups` from the `Resources` menu, then click
  `Add`.
* Enter a username, full name, last name, e-mail address, and password, then
  click `Ok`.
* Click `Save` in the `Users & Groups` pane.

Try to add the user to both clusters at the same time, since this makes it
easy to keep the UIDs and GIDs the same, in case the two clusters are ever
connected to each other.


# Failing over master nodes

To fail over to a desired master node, run
`/cm/local/apps/cluster-tools/bin/cmha makeactive` on the master node you
want to take over for that cluster.
