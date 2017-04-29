# android-transfer-media

This is how I move media from Android to my computer.

* [`adb`](adb) is my previous method. It uses ADB `push`, etc., over USB.
* [`adb-ssh-transfer`](adb-ssh-transfer) is my current method. It uses ADB to set up forwards over USB that are then used with Rsync and SSH via the [SSHelper](https://play.google.com/store/apps/details?id=com.arachnoid.sshelper) app.
