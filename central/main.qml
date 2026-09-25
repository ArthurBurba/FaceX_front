import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

ApplicationWindow {
    id: window
    width: 1280
    height: 720
    visible: true
    title: "X-FACE — Central de Verificação"
    color: "#080D13"

    property string nomeProcurado: "Gustavo Henrique"
    property string statusProcurado: "PROCURADO — SIMULAÇÃO"
    property string similaridade: "52.10%"
    property string localDetectado: "Faculdade"
    property string dataHora: "2026-08-28 19:06:42.874127"
    property string idadeProcurado: "22 anos"
    property string crimeProcurado: "Roubo — SIMULAÇÃO"
    property string cameraDetectada: "CAM-001"
    property string ocorrenciaStatus: "PENDING"

    // imagem fundo
    Image {
        id: bgImageSource
        anchors.fill: parent
        source: "https://www.espacohausimoveis.com.br/blog/wp-content/uploads/2024/05/53439242167_0bcfe4efd5_k.jpg"
        fillMode: Image.PreserveAspectCrop
        visible: false
    }

    // fundo borrado
    FastBlur {
        id: bgBlur
        anchors.fill: parent
        source: bgImageSource
        radius: 40
    }

    // fundo escuro
    Rectangle {
        anchors.fill: parent
        color: "#000000"
        opacity: 0.75
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 12

        // header superior
        RowLayout {
            Layout.fillWidth: true

            // bloco esquerda
            RowLayout {
                spacing: 10

                // texto principal
                Text {
                    text: "X-FACE"
                    color: "#E5DBFF"
                    font.bold: true
                    font.pixelSize: 18
                }

                // logo
                Image {
                    id: imgLogo
                    Layout.preferredWidth: 40
                    Layout.preferredHeight: 40
                    Layout.rightMargin: 30
                    fillMode: Image.PreserveAspectFit
                    source: "Logo.png"
                }

                // subtitulo
                Text {
                    text: "Central verificação de ocorrências"
                    color: "#8674CC"
                    font.pixelSize: 14
                }
            }

            // espacador
            Item {
                Layout.fillWidth: true
            }

            // ocorrencias ativas
            Text { text: "1 ocorrência ativa"; color: "#38bdf8"; font.pixelSize: 13 }
        }

        // layout principal
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 14

            // painel ocorrencias ativas
            Rectangle {
                Layout.preferredWidth: 360
                Layout.fillHeight: true
                color: "#80101633"
                radius: 8
                border.color: "#3323334C"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 12
                    spacing: 10

                    Text {
                        text: "OCORRÊNCIAS ATIVAS"
                        color: "#D6C7FF"
                        font.bold: true
                        font.pixelSize: 13
                    }

                    // lista ocorrencias
                    ListView {
                        id: listOcorrencias
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        clip: true
                        model: ListModel {
                            ListElement { idOcorrencia: "ID 20"; nome: "Gustavo Henrique"; sim: "52.10%"; cam: "CAM-001" }
                        }

                        // item lista
                        delegate: Rectangle {
                            width: listOcorrencias.width
                            height: 38
                            color: "#E6161829"
                            radius: 4

                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 8
                                spacing: 6

                                Text { text: model.idOcorrencia; color: "#B89577"; font.bold: true; font.pixelSize: 12 }
                                Text { text: "|"; color: "#B9C278" }
                                Text { text: model.nome; color: "#D9A173"; font.pixelSize: 12; Layout.fillWidth: true; elide: Text.ElideRight }
                                Text { text: "|"; color: "#B9C278" }
                                Text { text: model.sim; color: "#A8184F"; font.pixelSize: 12 }
                                Text { text: "|"; color: "#B9C278" }
                                Text { text: model.cam; color: "#D1BFFF"; font.pixelSize: 12 }
                            }
                        }
                    }
                }
            }

            // painel fotos e info
            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 12

                // quadros imagens
                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 330
                    spacing: 20

                    // espacador
                    Item {
                        Layout.fillWidth: true
                    }

                    // foto referencia
                    Rectangle {
                        Layout.preferredWidth: 330
                        Layout.preferredHeight: 330
                        color: "#2E3154"
                        radius: 8
                        border.color: "#4E5383"

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 8
                            spacing: 6

                            Text {
                                text: "FOTO DE REFERÊNCIA"
                                color: "#D6C7FF"
                                font.bold: true
                                font.pixelSize: 11
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                color: "#0f172a"
                                radius: 4
                                clip: true

                                Image {
                                    id: imgReferencia
                                    anchors.fill: parent
                                    fillMode: Image.PreserveAspectFit
                                    source: ""
                                }

                                Text {
                                    anchors.centerIn: parent
                                    text: "Visualização Foto Referência"
                                    color: "#475569"
                                    font.pixelSize: 11
                                    visible: imgReferencia.status !== Image.Ready
                                }
                            }
                        }
                    }

                    // frame capturado
                    Rectangle {
                        Layout.preferredWidth: 330
                        Layout.preferredHeight: 330
                        color: "#2E3154"
                        radius: 8
                        border.color: "#4E5383"

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 8
                            spacing: 6

                            Text {
                                text: "FRAME CAPTURADO"
                                color: "#D6C7FF"
                                font.bold: true
                                font.pixelSize: 11
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                color: "#0f172a"
                                radius: 4
                                clip: true

                                Image {
                                    id: imgCaptura
                                    anchors.fill: parent
                                    fillMode: Image.PreserveAspectFit
                                    source: ""
                                }

                                Text {
                                    anchors.centerIn: parent
                                    text: "Visualização Frame Capturado"
                                    color: "#475569"
                                    font.pixelSize: 11
                                    visible: imgCaptura.status !== Image.Ready
                                }
                            }
                        }

                        // espacador
                        Item {
                            Layout.fillWidth: true
                        }
                    }

                    // espacador
                    Item {
                        Layout.fillWidth: true
                    }
                }

                // painel informacoes procurado
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#D9161B33"
                    radius: 8
                    border.color: "#444E5383"

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 14
                        spacing: 8

                        Text { text: "INFORMAÇÕES DO PROCURADO"; color: "#E5DBFF"; font.bold: true; font.pixelSize: 13 }

                        // grid informacoes
                        GridLayout {
                            columns: 4
                            rowSpacing: 8
                            columnSpacing: 16
                            Layout.fillWidth: true

                            Text { text: "Nome:"; color: "#E5DBFF"; font.pixelSize: 12 }
                            Text { text: window.nomeProcurado; color: "#ffffff"; font.bold: true; font.pixelSize: 12 }

                            Text { text: "Idade:"; color: "#E5DBFF"; font.pixelSize: 12 }
                            Text { text: window.idadeProcurado; color: "#ffffff"; font.bold: true; font.pixelSize: 12 }

                            Text { text: "Status:"; color: "#E5DBFF"; font.pixelSize: 12 }
                            Text { text: window.statusProcurado; color: "#FF7878"; font.bold: true; font.pixelSize: 12 }

                            Text { text: "Crime:"; color: "#E5DBFF"; font.pixelSize: 12 }
                            Text { text: window.crimeProcurado; color: "#ffffff"; font.bold: true; font.pixelSize: 12 }

                            Text { text: "Similaridade:"; color: "#E5DBFF"; font.pixelSize: 12 }
                            Text { text: window.similaridade; color: "#DB744F"; font.bold: true; font.pixelSize: 12 }

                            Text { text: "Câmera:"; color: "#E5DBFF"; font.pixelSize: 12 }
                            Text { text: window.cameraDetectada; color: "#ffffff"; font.bold: true; font.pixelSize: 12 }

                            Text { text: "Local:"; color: "#E5DBFF"; font.pixelSize: 12 }
                            Text { text: window.localDetectado; color: "#ffffff"; font.bold: true; font.pixelSize: 12 }

                            Text { text: "Ocorrência:"; color: "#E5DBFF"; font.pixelSize: 12 }
                            Text { text: window.ocorrenciaStatus; color: "#B8914F"; font.bold: true; font.pixelSize: 12 }

                            Text { text: "Detectado em:"; color: "#E5DBFF"; font.pixelSize: 12 }
                            Text { text: window.dataHora; color: "#ffffff"; font.bold: true; font.pixelSize: 12; Layout.columnSpan: 3 }
                        }

                        // espacador
                        Item { Layout.fillHeight: true }

                        // botoes
                        RowLayout {
                            spacing: 12
                            Layout.fillWidth: true

                            // botao confirmar
                            Rectangle {
                                id: btnConfirmar
                                Layout.preferredWidth: 130
                                Layout.preferredHeight: 36
                                radius: 4
                                border.color: "#C2D0F6"
                                border.width: 1

                                color: mouseConfirmar.pressed
                                       ? "#627BA1"
                                       : (mouseConfirmar.containsMouse ? "#A8CCFF" : "#C2D0F6")

                                Behavior on color {
                                    ColorAnimation { duration: 150 }
                                }

                                Text {
                                    anchors.centerIn: parent
                                    text: "CONFIRMAR"
                                    color: "#080D13"
                                    font.bold: true
                                    font.pixelSize: 12
                                }

                                MouseArea {
                                    id: mouseConfirmar
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onClicked: root.confirmarClicked()
                                }
                            }

                            // botao descartar
                            Rectangle {
                                id: btnDescartar
                                Layout.preferredWidth: 130
                                Layout.preferredHeight: 36
                                radius: 4
                                border.color: "#733535"
                                border.width: 1

                                color: mouseDescartar.pressed
                                       ? "#A83D3D"
                                       : (mouseDescartar.containsMouse ? "#C26D6D" : "#733535")

                                Behavior on color {
                                    ColorAnimation { duration: 150 }
                                }

                                Text {
                                    anchors.centerIn: parent
                                    text: "DESCARTAR"
                                    color: "#E5DBFF"
                                    font.bold: true
                                    font.pixelSize: 12
                                }

                                MouseArea {
                                    id: mouseDescartar
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onClicked: root.descartarClicked()
                                }
                            }
                        }
                    }
                }
            }
        }

        // rodape
        Text {
            text: "Central conectada — monitoramento ativo"
            color: "#64748b"
            font.pixelSize: 11
        }
    }
}
