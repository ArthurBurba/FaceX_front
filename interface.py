import sys
import os
from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

class FaceXBackend(QObject):
    def __init__(self):
        super().__init__()

    @Slot()
    def confirmarClicked(self):
        print("[BACKEND] Ocorrência CONFIRMADA!")

    @Slot()
    def descartarClicked(self):
        print("[BACKEND] Ocorrência DESCARTADA!")

def run_app():
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    backend = FaceXBackend()
    engine.rootContext().setContextProperty("root", backend)

    # Garante o caminho correto para o main.qml na mesma pasta do script
    dir_atual = os.path.dirname(os.path.abspath(__file__))
    qml_path = os.path.join(dir_atual, "main.qml")

    engine.load(qml_path)

    if not engine.rootObjects():
        print("[ERRO] Não foi possível carregar o QML. Verifique os imports no main.qml.")
        sys.exit(-1)

    sys.exit(app.exec())

if __name__ == "__main__":
    run_app()