---
---
# Setting up a new Macintosh

* Go through the first boot set up, creating a user for the machine's owner.

* It can be convenient for your UID to be the same on the Mac as on the cluster.
Doing this without creating another administrator user is a little painful:

  * In System Preferences, unlock Users & Groups so that right-clicking on yourself gives an _Advanced Options_ menu, and change your User ID.

  * Pressing okay somewhat breaks your user (as its home directory is now owned by someone else), so just log out and reboot.

  * Restart the Mac in single user mode (by holding Cmd-S while booting) and type

        mount -uw /     # Remount the disk read/write
        find /Users/<username> -user 501 -exec chown <uid> '{}' +
        reboot

* Turn on FileVault.  (Use a recovery code rather than iCloud, and write it down in the sysadmin notebook.)

* Connect via ethernet or the **flexaccess** network, and set up **eduroam** from <http://wifisetup.gla.ac.uk/>.

* Set up the Glasgow VPN.

* Install PullPrint from <https://macprint.gla.ac.uk/>.

* Create an Apple ID [without attaching a credit card][AppleID].

* Software that you may consider installing:
  * Xcode (via the Mac App Store)
  * Microsoft Office (via [office365.gla.ac.uk](https://office365.gla.ac.uk/))
  * [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  * [Brew](https://brew.sh)
  * [TeX](https://tug.org/mactex/mactex-download.html)

[AppleID]: https://support.apple.com/en-gb/HT204034

<!-- vim:set linebreak: -->
