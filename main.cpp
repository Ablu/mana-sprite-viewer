/*
 * Mana Mobile
 * Copyright (C) 2010  Thorbjørn Lindeijer
 * Copyright (C) 2012  Erik Schilling
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation; either version 2 of the License, or (at your option) any later
 * version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program; if not, see <http://www.gnu.org/licenses/>.
 */

#include <QDebug>
#include <QDir>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickWindow>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setApplicationName("Mana Sprite Viewer");
    app.setOrganizationDomain("manasource.org");
    app.setOrganizationName(QLatin1String("mana"));
    app.setApplicationVersion("0.1");

    QQmlApplicationEngine engine;

    QStringList arguments = app.arguments();

    QQmlContext *context = engine.rootContext();

    context->setContextProperty("resourceDir", arguments[1]);

    QStringList sprites;
    for (int i = 2, max = arguments.length(); i < max; ++i) {
        sprites.append(arguments[i]);
    }
    context->setContextProperty("spriteFiles", sprites);

    QString manaImportPath = QString::fromLatin1("%1/../lib/libmana/qml/").arg(QCoreApplication::applicationDirPath());
    engine.addImportPath(manaImportPath);

    QString mainWindowFile = "share/mana-sprite-viewer/qml/main/MainWindow.qml";
    engine.load(QString::fromLatin1("%1/../%2").arg(QCoreApplication::applicationDirPath(), mainWindowFile));

    QQuickWindow *window = qobject_cast<QQuickWindow *>(engine.rootObjects().first());
    if (!window) {
        qWarning() << "no window";
        return -1;
    }

    window->show();

    return app.exec();
}
