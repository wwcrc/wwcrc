# Using to the Cluster Proxy Servers

The clusters use several DNS domains and networks that are not reachable on
the general Internet. For example, to reach the Terascala dashboard or the
nodes' remote management controllers, you must proxy through one of the
cluster master nodes.

It's easiest to set up Chrome to automatically proxy requests for the
relevant hosts. That way, when you enter a cluster hostname in your
browser, it will use the proxy automatically. Chrome will only use the
proxy for cluster URLs, not all your web browsing activity.

* Install the [ProxyOmega extension](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif).
* Click the extension icon (a black ring) to the right of Chrome's address
  bar, then click Options.
* Skip the tutorial, then choose the `auto switch` profile on the left side.
* Skip the guide, then delete the two `Switch rules`.
* Delete the default `proxy` profile.
  * Click the `proxy` profile in the left side.
  * Click `Delete` in the top right, then confirm by clicking `Delete`
    in the popup.
* Create a profile for the first cluster.
  * Click `New profile...` in the `PROFILES` list on the left side.
  * Enter a name, like `wwcrc cluster01` and click `Create`.
  * Choose `HTTP` for the protocol, enter `hn01.tcrc.gla.ac.uk` for the
    server and `3128` for the port.
* Create a second profile for `wwcrc cluster02`, but use `hn03.tcrc.gla.ac.uk`
  for the server.
* Use the WWCRC profiles automatically.
  * Choose the `auto switch` profile on the left side.
  * Click `Add a rule list`.
  * Enter `https://raw.githubusercontent.com/wwcrc/wwcrc/master/proxy-rules.txt`
    for the `Rule List URL`.
  * Click `Download Profile Now`, then `Apply changes`.
  * Choose one of the WWCRC profiles for the `Rule list rules` item under
   `Switch rules`. This will be the cluster that you connect to by default.
    * Keep in mind that there are two clusters, and the hosts are named the
      same in each (i.e., there is an `nfs02` in both clusters). If you
      want to connect to the other cluster, choose that profile manually
      from the black ring icon to the right of the address bar. That will
      force Chrome to use that particular cluster.
* Choose `Interface` settings on the left side.
* Choose `auto switch` for the `Startup Profile`.
* Choose the `Apply changes` action on the left side.
* You may have to choose `auto switch` from the black ring icon to the right
  of the address bar.
