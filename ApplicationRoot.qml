import QtQuick 2.1
import QtWebEngine 1.2

QtObject {
    id: root

    property QtObject defaultProfile: WebEngineProfile {
        storageName: "Profile"
        offTheRecord: false
    }

    property Component browserWindowComponent: BrowserWindow {
        applicationRoot: root
        onClosing: destroy()
    }
    function createWindow() {
        var newWindow = browserWindowComponent.createObject(root);
        newWindow.currentWebView.profile = defaultProfile;
        defaultProfile.downloadRequested.connect(newWindow.onDownloadRequested);
        return newWindow;
    }
    function load(url) {
        var browserWindow = createWindow();
        browserWindow.currentWebView.url = url;
    }
}
