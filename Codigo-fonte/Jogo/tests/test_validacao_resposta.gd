extends SceneTree

const ARQUIVO_FASE = "res://scripts/fase_1.gd"

func _initialize() -> void:
	var arquivo = FileAccess.open(ARQUIVO_FASE, FileAccess.READ)

	if arquivo == null:
		push_error("Nao foi possivel abrir fase_1.gd")
		quit(1)
		return

	var codigo = arquivo.get_as_text()

	var regra_presente = (
		codigo.contains("if resposta_selecionada == -1:")
		and codigo.contains('_falar("Escolha uma alternativa antes de confirmar!")')
	)

	if regra_presente:
		print("PASSOU: existe validacao para resposta vazia.")
		quit(0)
	else:
		push_error("FALHOU: validacao de resposta vazia nao encontrada.")
		quit(1)