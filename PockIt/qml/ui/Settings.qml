import QtQuick 2.4
import QtQuick.LocalStorage 2.0
import Ubuntu.Components 1.3

import "../js/localdb.js" as LocalDB
import "../js/user.js" as User
import "../js/apiKeys.js" as ApiKeys
import "../js/scripts.js" as Scripts

Page {
    id: settingsPage

    header: PageHeader {
        title: i18n.tr("Settings")

        leadingActionBar {
            actions: [
                Action {
                    id: closePageAction
                    text: i18n.tr("Close")
                    iconName: "back"
                    onTriggered: {
                        isArticleOpen = false
                        pageLayout.removePages(settingsPage)
                    }
                }

            ]
        }
    }

    Flickable {
        id: flickable
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            top: settingsPage.header.bottom
        }
        contentHeight: columnSuperior.height

        Column {
           id: columnSuperior
           width: parent.width

           ListItem {
               height: accountHeader.height

               ListItemLayout {
                   id: accountHeader

                   title.text: i18n.tr("Account")
                   title.font.weight: Text.Normal
               }
           }

           ListItem {
               height: logoutLayout.height
               divider.visible: false
               ListItemLayout {
                   id: logoutLayout

                   title.text: i18n.tr("Logout")
                   subtitle.text: User.getKey('username') ? User.getKey('username') : ''
                   subtitle.visible: User.getKey('username') ? true : false
               }

               onClicked: {
                   Scripts.logOut()
               }
           }

           ListItem {
               height: generalHeader.height

               ListItemLayout {
                   id: generalHeader

                   title.text: i18n.tr("General")
                   title.font.weight: Text.Normal
               }
           }

           ListItem {
               height: themeLayout.height
               divider.visible: false
               ListItemLayout {
                   id: themeLayout

                   title.text: i18n.tr("Dark theme")
                   subtitle.text: i18n.tr("You can also toggle this by tapping the Theme button in the Article View")
                   subtitle.maximumLineCount: 2
                   subtitle.wrapMode: Text.WordWrap

                   Switch {
                       id: themeSwitch
                       SlotsLayout.position: SlotsLayout.Trailing
                       checked: settings.darkTheme
                       onCheckedChanged: {
                            if (checked) {
                                settings.darkTheme = true
                                themeManager.currentThemeIndex = 1
                            } else {
                                settings.darkTheme = false
                                themeManager.currentThemeIndex = 0
                            }
                       }
                   }
               }
           }

           ListItem {
               height: readingHeader.height

               ListItemLayout {
                   id: readingHeader

                   title.text: i18n.tr("Reading")
                   title.font.weight: Text.Normal
               }
           }

           ListItem {
               height: justifiedTextLayout.height
               ListItemLayout {
                   id: justifiedTextLayout

                   title.text: i18n.tr("Justified Text")
                   subtitle.text: i18n.tr("Display text in Article View with justification")
                   subtitle.maximumLineCount: 2
                   subtitle.wrapMode: Text.WordWrap

                   Switch {
                       id: justifiedTextSwitch
                       SlotsLayout.position: SlotsLayout.Trailing
                       checked: settings.justifiedText
                       onCheckedChanged: {
                            if (checked) {
                                settings.justifiedText = true
                            } else {
                                settings.justifiedText = false
                            }
                       }
                   }
               }
           }

           ListItem {
               height: openBestViewLayout.height
               divider.visible: false
               ListItemLayout {
                   id: openBestViewLayout

                   title.text: i18n.tr("Open best view")
                   subtitle.text: i18n.tr("PockIt will automatically decide the best view (Article or Web View) to show")
                   subtitle.maximumLineCount: 2
                   subtitle.wrapMode: Text.WordWrap

                   Switch {
                       id: openBestViewSwitch
                       SlotsLayout.position: SlotsLayout.Trailing
                       checked: settings.openBestView
                       onCheckedChanged: {
                            if (checked) {
                                settings.openBestView = true
                            } else {
                                settings.openBestView = false
                            }
                       }
                   }
               }
           }

           ListItem {
               height: offlineReadingSyncingHeader.height

               ListItemLayout {
                   id: offlineReadingSyncingHeader

                   title.text: i18n.tr("Offline Reading & Syncing")
                   title.font.weight: Text.Normal
               }
           }

           ListItem {
               height: autoSyncLayout.height
               ListItemLayout {
                   id: autoSyncLayout

                   title.text: i18n.tr("Sync when app opens")

                   Switch {
                       id: autoSyncSwitch
                       SlotsLayout.position: SlotsLayout.Trailing
                       checked: settings.autoSync
                       onCheckedChanged: {
                            if (checked) {
                                settings.autoSync = true
                            } else {
                                settings.autoSync = false
                            }
                       }
                   }
               }
           }

           ListItem {
               height: downloadArticlesLayout.height
               ListItemLayout {
                   id: downloadArticlesLayout

                   title.text: i18n.tr("Auto download articles")
                   subtitle.maximumLineCount: 2
                   subtitle.wrapMode: Text.WordWrap

                   Switch {
                       id: downloadArticlesSync
                       SlotsLayout.position: SlotsLayout.Trailing
                       checked: settings.downloadArticlesSync
                       onCheckedChanged: {
                            if (checked) {
                                settings.downloadArticlesSync = true
                            } else {
                                settings.downloadArticlesSync = false
                            }
                       }
                   }
               }
           }

           ListItem {
               height: clearFilesLayout.height
               divider.visible: false
               ListItemLayout {
                   id: clearFilesLayout

                   title.text: i18n.tr("Clear downloaded files")
               }

               onClicked: {

               }
           }

           ListItem {
               height: listHeader.height

               ListItemLayout {
                   id: listHeader

                   title.text: i18n.tr("List")
                   title.font.weight: Text.Normal
               }
           }

           ListItem {
               height: sortLayout.height
               divider.visible: false
               ListItemLayout {
                   id: sortLayout

                   title.text: i18n.tr("Sort")
                   subtitle.text: settings.listSort === 'DESC' ? i18n.tr("Newest First") : i18n.tr("Oldest First")
                   subtitle.maximumLineCount: 2
                   subtitle.wrapMode: Text.WordWrap
               }

               onClicked: {
                   isArticleOpen = true
                   pageLayout.addPageToNextColumn(settingsPage, Qt.resolvedUrl("settings/ListSort.qml"))
               }
           }

           ListItem {
               height: aboutHeader.height

               ListItemLayout {
                   id: aboutHeader

                   title.text: i18n.tr("About")
                   title.font.weight: Text.Normal
               }
           }

           ListItem {
               height: aboutLayout.height
               ListItemLayout {
                   id: aboutLayout

                   title.text: i18n.tr("About")
                   subtitle.text: i18n.tr("Version %1").arg(appVersion)
                   subtitle.maximumLineCount: 2
                   subtitle.wrapMode: Text.WordWrap
               }

               onClicked: {
                   isArticleOpen = true
                   pageLayout.addPageToNextColumn(settingsPage, Qt.resolvedUrl("About.qml"))
               }
           }

           ListItem {
               height: creditsLayout.height
               divider.visible: false
               ListItemLayout {
                   id: creditsLayout

                   title.text: i18n.tr("Credits")
               }

               onClicked: {
                   isArticleOpen = true
                   pageLayout.addPageToNextColumn(settingsPage, Qt.resolvedUrl("Credits.qml"))
               }
           }
        }
    }
}