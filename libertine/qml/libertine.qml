/**
 * @file libertine.qml
 * @brief Libertine app main view.
 */
/*
 * Copyright 2015 Canonical Ltd
 *
 * Libertine is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License, version 3, as published by the
 * Free Software Foundation.
 *
 * Libertine is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 2.4
import Ubuntu.Components 1.2


MainView {
    id: mainView
    objectName: "mainView"
    applicationName: "libertine"
    width:  units.gu(90)
    height: units.gu(75)
    property var currentContainer: undefined

    WelcomeView {
        id: welcomeView
        visible: false
    }

    ContainersView {
        id: containersView
        visible: false
    }

    HomeView {
        id: homeView
        visible: false
    }

    AppAddView {
        id: appAddView
        visible: false
    }

    PageStack {
        id: pageStack
        state: "WELCOME"
        property var page: welcomeView

        Component.onCompleted: {
            push(page)
        }

        onPageChanged: {
            push(page)
        }
    }

    // The pages/views will set the state to the next one when it is done
    // like this: onClicked: {mainView.state = "TESTSELECTION"}
    states: [
        State {
            name: "WELCOME"
            PropertyChanges {
                target: pageStack
                page:   welcomeView
            }
        },
        State {
            name: "CONTAINERS_VIEW"
            PropertyChanges {
                target: pageStack
                page:   containersView
            }
        },
        State {
            name: "HOMEPAGE"
            PropertyChanges {
                target: pageStack
                page:   homeView
            }
        },
        State {
            name: "ADD_APPS"
            PropertyChanges {
                target: pageStack
                page:   appAddView
            }
        }
    ]

    Component.onCompleted: {
        mainView.currentContainer = containerConfigList.defaultContainerId
        if (mainView.currentContainer) {
            pageStack.pop()
            state = "HOMEPAGE"
        }
        else if (!containerConfigList.empty()) {
            pageStack.pop()
            state = "CONTAINERS_VIEW"
        }
    }
}
