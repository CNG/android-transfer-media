# android-transfer-media

This is how I move media from Android to my computer.

* [`ssh-transfer`](ssh-transfer) is my current method. It uses SSH over WiFi and Rsync via [@D4rCM4rC/MagiskSSH](https://github.com/D4rCM4rC/MagiskSSH).
* [`adb-ssh-transfer`](adb-ssh-transfer) is my previous method. It uses ADB to set up forwards over USB that are then used with Rsync and SSH via the [SSHelper](https://play.google.com/store/apps/details?id=com.arachnoid.sshelper) app.
* [`adb`](adb) is another previous method. It uses ADB `push`, etc., over USB.

