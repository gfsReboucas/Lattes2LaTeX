require 'rexml/document'
include REXML

class CurriculoVitae

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SISTEMA-ORIGEM-XML'] = arg.attributes['SISTEMA-ORIGEM-XML']
		@atributos['NUMERO-IDENTIFICADOR'] = arg.attributes['NUMERO-IDENTIFICADOR']
		@atributos['FORMATO-DATA-ATUALIZACAO'] = arg.attributes['FORMATO-DATA-ATUALIZACAO']
		@atributos['DATA-ATUALIZACAO'] = arg.attributes['DATA-ATUALIZACAO']
		@atributos['FORMATO-HORA-ATUALIZACAO'] = arg.attributes['FORMATO-HORA-ATUALIZACAO']
		@atributos['HORA-ATUALIZACAO'] = arg.attributes['HORA-ATUALIZACAO']
		@atributos['xmlns:lattes'] = arg.attributes['xmlns:lattes']

		@elementos = Hash.new
		@elementos['DADOS-GERAIS'] = DadosGerais.new(arg.elements['DADOS-GERAIS'])
		@elementos['PRODUCAO-BIBLIOGRAFICA'] = ProducaoBibliografica.new(arg.elements['PRODUCAO-BIBLIOGRAFICA'])
		@elementos['PRODUCAO-TECNICA'] = ProducaoTecnica.new(arg.elements['PRODUCAO-TECNICA'])
		@elementos['OUTRA-PRODUCAO'] = OutraProducao.new(arg.elements['OUTRA-PRODUCAO'])
		@elementos['DADOS-COMPLEMENTARES'] = DadosComplementares.new(arg.elements['DADOS-COMPLEMENTARES'])
	end

		def parse
			puts '\documentclass[a4paper]{article}'
			puts '\usepackage[brazil]{babel}'
			puts '\usepackage[utf8]{inputenc}'
			puts
			puts '\begin{document}'
			@elementos['DADOS-GERAIS'].toTEX
			puts '\newpage'
			@elementos['PRODUCAO-BIBLIOGRAFICA'].toTEX
			puts '\newpage'
			@elementos['DADOS-COMPLEMENTARES'].toTEX
			puts '\end{document}'
		end

end


class DadosGerais

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-COMPLETO'] = arg.attributes['NOME-COMPLETO']
		@atributos['NOME-EM-CITACOES-BIBLIOGRAFICAS'] = arg.attributes['NOME-EM-CITACOES-BIBLIOGRAFICAS']
		@atributos['NACIONALIDADE'] = arg.attributes['NACIONALIDADE']
		@atributos['CPF'] = arg.attributes['CPF']
		@atributos['NUMERO-DO-PASSAPORTE'] = arg.attributes['NUMERO-DO-PASSAPORTE']
		@atributos['PAIS-DE-NASCIMENTO'] = arg.attributes['PAIS-DE-NASCIMENTO']
		@atributos['UF-NASCIMENTO'] = arg.attributes['UF-NASCIMENTO']
		@atributos['CIDADE-NASCIMENTO'] = arg.attributes['CIDADE-NASCIMENTO']
		@atributos['FORMATO-DATA-DE-NASCIMENTO'] = arg.attributes['FORMATO-DATA-DE-NASCIMENTO']
		@atributos['DATA-NASCIMENTO'] = arg.attributes['DATA-NASCIMENTO']
		@atributos['SEXO'] = arg.attributes['SEXO']
		@atributos['NUMERO-IDENTIDADE'] = arg.attributes['NUMERO-IDENTIDADE']
		@atributos['ORGAO-EMISSOR'] = arg.attributes['ORGAO-EMISSOR']
		@atributos['UF-ORGAO-EMISSOR'] = arg.attributes['UF-ORGAO-EMISSOR']
		@atributos['FORMATO-DATA-DE-EMISSAO'] = arg.attributes['FORMATO-DATA-DE-EMISSAO']
		@atributos['DATA-DE-EMISSAO'] = arg.attributes['DATA-DE-EMISSAO']
		@atributos['NOME-DO-PAI'] = arg.attributes['NOME-DO-PAI']
		@atributos['NOME-DA-MAE'] = arg.attributes['NOME-DA-MAE']
		@atributos['PERMISSAO-DE-DIVULGACAO'] = arg.attributes['PERMISSAO-DE-DIVULGACAO']
		@atributos['NOME-DO-ARQUIVO-DE-FOTO'] = arg.attributes['NOME-DO-ARQUIVO-DE-FOTO']
		@atributos['TEXTO-RESUMO-CV-RH'] = arg.attributes['TEXTO-RESUMO-CV-RH']
		@atributos['OUTRAS-INFORMACOES-RELEVANTES'] = arg.attributes['OUTRAS-INFORMACOES-RELEVANTES']
		@atributos['DATA-FALECIMENTO'] = arg.attributes['DATA-FALECIMENTO']
		@atributos['SIGLA-PAIS-NACIONALIDADE'] = arg.attributes['SIGLA-PAIS-NACIONALIDADE']
		@atributos['PAIS-DE-NACIONALIDADE'] = arg.attributes['PAIS-DE-NACIONALIDADE']
		@atributos['RACA-OU-COR'] = arg.attributes['RACA-OU-COR']

		@elementos = Hash.new
		@elementos['RESUMO-CV'] = ResumoCv.new(arg.elements['RESUMO-CV'])
		@elementos['OUTRAS-INFORMACOES-RELEVANTES'] = OutrasInformacoesRelevantes.new(arg.elements['OUTRAS-INFORMACOES-RELEVANTES'])
		@elementos['ENDERECO'] = Endereco.new(arg.elements['ENDERECO'])
		@elementos['FORMACAO-ACADEMICA-TITULACAO'] = FormacaoAcademicaTitulacao.new(arg.elements['FORMACAO-ACADEMICA-TITULACAO'])
		@elementos['ATUACOES-PROFISSIONAIS'] = AtuacoesProfissionais.new(arg.elements['ATUACOES-PROFISSIONAIS'])
		@elementos['AREAS-DE-ATUACAO'] = AreasAtuacao.new(arg.elements['AREAS-DE-ATUACAO'])
		@elementos['IDIOMAS'] = Idioma.new(arg.elements['IDIOMAS'])
		@elementos['PREMIOS-TITULOS'] = PremiosTitulos.new(arg.elements['PREMIOS-TITULOS'])
	end

		def toTEX
			puts '\section*{Curriculum Vitae}'
			puts @atributos['NOME-COMPLETO']
			puts @atributos['CIDADE-NASCIMENTO'] + ', '
			puts @atributos['PAIS-DE-NASCIMENTO']
			puts
			@elementos['RESUMO-CV'].toTEX
			@elementos['IDIOMAS'].toTEX
			@elementos['FORMACAO-ACADEMICA-TITULACAO'].toTEX
		end

end


class ResumoCv

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TEXTO-RESUMO-CV-RH'] = arg.attributes['TEXTO-RESUMO-CV-RH']
		@atributos['TEXTO-RESUMO-CV-RH-EN'] = arg.attributes['TEXTO-RESUMO-CV-RH-EN']

		@elementos = Hash.new
	end

		def toTEX
			puts '\subsection*{Resumo}'
			puts @atributos['TEXTO-RESUMO-CV-RH']
		end

end


class OutrasInformacoesRelevantes

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['OUTRAS-INFORMACOES-RELEVANTES'] = arg.attributes['OUTRAS-INFORMACOES-RELEVANTES']

		@elementos = Hash.new
	end


end


class Endereco

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['FLAG-DE-PREFERENCIA'] = arg.attributes['FLAG-DE-PREFERENCIA']

		@elementos = Hash.new
		@elementos['ENDERECO-PROFISSIONAL'] = EnderecoProfissional.new(arg.elements['ENDERECO-PROFISSIONAL'])
		@elementos['ENDERECO-RESIDENCIAL'] = EnderecoResidencial.new(arg.elements['ENDERECO-RESIDENCIAL'])
	end


end


class EnderecoProfissional

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['CODIGO-INSTITUICAO-EMPRESA'] = arg.attributes['CODIGO-INSTITUICAO-EMPRESA']
		@atributos['NOME-INSTITUICAO-EMPRESA'] = arg.attributes['NOME-INSTITUICAO-EMPRESA']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-UNIDADE'] = arg.attributes['CODIGO-UNIDADE']
		@atributos['NOME-UNIDADE'] = arg.attributes['NOME-UNIDADE']
		@atributos['LOGRADOURO-COMPLEMENTO'] = arg.attributes['LOGRADOURO-COMPLEMENTO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['UF'] = arg.attributes['UF']
		@atributos['CEP'] = arg.attributes['CEP']
		@atributos['CIDADE'] = arg.attributes['CIDADE']
		@atributos['BAIRRO'] = arg.attributes['BAIRRO']
		@atributos['DDD'] = arg.attributes['DDD']
		@atributos['TELEFONE'] = arg.attributes['TELEFONE']
		@atributos['RAMAL'] = arg.attributes['RAMAL']
		@atributos['FAX'] = arg.attributes['FAX']
		@atributos['CAIXA-POSTAL'] = arg.attributes['CAIXA-POSTAL']
		@atributos['E-MAIL'] = arg.attributes['E-MAIL']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']

		@elementos = Hash.new
	end


end


class EnderecoResidencial

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['LOGRADOURO'] = arg.attributes['LOGRADOURO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['UF'] = arg.attributes['UF']
		@atributos['CEP'] = arg.attributes['CEP']
		@atributos['CIDADE'] = arg.attributes['CIDADE']
		@atributos['BAIRRO'] = arg.attributes['BAIRRO']
		@atributos['DDD'] = arg.attributes['DDD']
		@atributos['TELEFONE'] = arg.attributes['TELEFONE']
		@atributos['RAMAL'] = arg.attributes['RAMAL']
		@atributos['FAX'] = arg.attributes['FAX']
		@atributos['CAIXA-POSTAL'] = arg.attributes['CAIXA-POSTAL']
		@atributos['E-MAIL'] = arg.attributes['E-MAIL']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']

		@elementos = Hash.new
	end


end


class PalavrasChave

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['PALAVRA-CHAVE-1'] = arg.attributes['PALAVRA-CHAVE-1']
		@atributos['PALAVRA-CHAVE-2'] = arg.attributes['PALAVRA-CHAVE-2']
		@atributos['PALAVRA-CHAVE-3'] = arg.attributes['PALAVRA-CHAVE-3']
		@atributos['PALAVRA-CHAVE-4'] = arg.attributes['PALAVRA-CHAVE-4']
		@atributos['PALAVRA-CHAVE-5'] = arg.attributes['PALAVRA-CHAVE-5']
		@atributos['PALAVRA-CHAVE-6'] = arg.attributes['PALAVRA-CHAVE-6']

		@elementos = Hash.new
	end


end


class AreasConhecimento

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['AREA-DO-CONHECIMENTO-1'] = AreaConhecimento.new(arg.elements['AREA-DO-CONHECIMENTO-1'])
		@elementos['AREA-DO-CONHECIMENTO-2'] = AreaConhecimento.new(arg.elements['AREA-DO-CONHECIMENTO-2'])
		@elementos['AREA-DO-CONHECIMENTO-3'] = AreaConhecimento.new(arg.elements['AREA-DO-CONHECIMENTO-3'])
	end


end


class AreaConhecimento

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-GRANDE-AREA-DO-CONHECIMENTO'] = arg.attributes['NOME-GRANDE-AREA-DO-CONHECIMENTO']
		@atributos['NOME-DA-AREA-DO-CONHECIMENTO'] = arg.attributes['NOME-DA-AREA-DO-CONHECIMENTO']
		@atributos['NOME-DA-SUB-AREA-DO-CONHECIMENTO'] = arg.attributes['NOME-DA-SUB-AREA-DO-CONHECIMENTO']
		@atributos['NOME-DA-ESPECIALIDADE'] = arg.attributes['NOME-DA-ESPECIALIDADE']

		@elementos = Hash.new
	end


end


class AreaConhecimento

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-GRANDE-AREA-DO-CONHECIMENTO'] = arg.attributes['NOME-GRANDE-AREA-DO-CONHECIMENTO']
		@atributos['NOME-DA-AREA-DO-CONHECIMENTO'] = arg.attributes['NOME-DA-AREA-DO-CONHECIMENTO']
		@atributos['NOME-DA-SUB-AREA-DO-CONHECIMENTO'] = arg.attributes['NOME-DA-SUB-AREA-DO-CONHECIMENTO']
		@atributos['NOME-DA-ESPECIALIDADE'] = arg.attributes['NOME-DA-ESPECIALIDADE']

		@elementos = Hash.new
	end


end


class AreaConhecimento

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-GRANDE-AREA-DO-CONHECIMENTO'] = arg.attributes['NOME-GRANDE-AREA-DO-CONHECIMENTO']
		@atributos['NOME-DA-AREA-DO-CONHECIMENTO'] = arg.attributes['NOME-DA-AREA-DO-CONHECIMENTO']
		@atributos['NOME-DA-SUB-AREA-DO-CONHECIMENTO'] = arg.attributes['NOME-DA-SUB-AREA-DO-CONHECIMENTO']
		@atributos['NOME-DA-ESPECIALIDADE'] = arg.attributes['NOME-DA-ESPECIALIDADE']

		@elementos = Hash.new
	end


end


class SetoresAtividade

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SETOR-DE-ATIVIDADE-1'] = arg.attributes['SETOR-DE-ATIVIDADE-1']
		@atributos['SETOR-DE-ATIVIDADE-2'] = arg.attributes['SETOR-DE-ATIVIDADE-2']
		@atributos['SETOR-DE-ATIVIDADE-3'] = arg.attributes['SETOR-DE-ATIVIDADE-3']

		@elementos = Hash.new
	end


end


class FormacaoAcademicaTitulacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['GRADUACAO'] = Array.new
		arg.elements.each('GRADUACAO') do | i |
			@elementos['GRADUACAO'].push(Graduacao.new(i))
		end
		@elementos['ESPECIALIZACAO'] = Array.new
		arg.elements.each('ESPECIALIZACAO') do | i |
			@elementos['ESPECIALIZACAO'].push(Especializacao.new(i))
		end
		@elementos['MESTRADO'] = Array.new
		arg.elements.each('MESTRADO') do | i |
			@elementos['MESTRADO'].push(Mestrado.new(i))
		end
		@elementos['DOUTORADO'] = Array.new
		arg.elements.each('DOUTORADO') do | i |
			@elementos['DOUTORADO'].push(Doutorado.new(i))
		end
		@elementos['POS-DOUTORADO'] = Array.new
		arg.elements.each('POS-DOUTORADO') do | i |
			@elementos['POS-DOUTORADO'].push(PosDoutorado.new(i))
		end
		@elementos['LIVRE-DOCENCIA'] = Array.new
		arg.elements.each('LIVRE-DOCENCIA') do | i |
			@elementos['LIVRE-DOCENCIA'].push(LivreDocencia.new(i))
		end
		@elementos['CURSO-TECNICO-PROFISSIONALIZANTE'] = Array.new
		arg.elements.each('CURSO-TECNICO-PROFISSIONALIZANTE') do | i |
			@elementos['CURSO-TECNICO-PROFISSIONALIZANTE'].push(CursoTecnicoProfissionalizante.new(i))
		end
		@elementos['MESTRADO-PROFISSIONALIZANTE'] = Array.new
		arg.elements.each('MESTRADO-PROFISSIONALIZANTE') do | i |
			@elementos['MESTRADO-PROFISSIONALIZANTE'].push(MestradoProfissionalizante.new(i))
		end
		@elementos['ENSINO-FUNDAMENTAL-PRIMEIRO-GRAU'] = Array.new
		arg.elements.each('ENSINO-FUNDAMENTAL-PRIMEIRO-GRAU') do | i |
			@elementos['ENSINO-FUNDAMENTAL-PRIMEIRO-GRAU'].push(EnsinoFundamentalPrimeiroGrau.new(i))
		end
		@elementos['ENSINO-MEDIO-SEGUNDO-GRAU'] = Array.new
		arg.elements.each('ENSINO-MEDIO-SEGUNDO-GRAU') do | i |
			@elementos['ENSINO-MEDIO-SEGUNDO-GRAU'].push(EnsinoMedioSegundoGrau.new(i))
		end
		@elementos['RESIDENCIA-MEDICA'] = Array.new
		arg.elements.each('RESIDENCIA-MEDICA') do | i |
			@elementos['RESIDENCIA-MEDICA'].push(ResidenciaMedica.new(i))
		end
		@elementos['APERFEICOAMENTO'] = Array.new
		arg.elements.each('APERFEICOAMENTO') do | i |
			@elementos['APERFEICOAMENTO'].push(Aperfeicoamento.new(i))
		end
	end


end


class CursoTecnicoProfissionalizante

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FORMACAO'] = arg.attributes['SEQUENCIA-FORMACAO']
		@atributos['NIVEL'] = arg.attributes['NIVEL']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['STATUS-DO-CURSO'] = arg.attributes['STATUS-DO-CURSO']
		@atributos['ANO-DE-INICIO'] = arg.attributes['ANO-DE-INICIO']
		@atributos['ANO-DE-CONCLUSAO'] = arg.attributes['ANO-DE-CONCLUSAO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-AGENCIA'] = arg.attributes['NOME-AGENCIA']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class EnsinoFundamentalPrimeiroGrau

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FORMACAO'] = arg.attributes['SEQUENCIA-FORMACAO']
		@atributos['NIVEL'] = arg.attributes['NIVEL']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['STATUS-DO-CURSO'] = arg.attributes['STATUS-DO-CURSO']
		@atributos['ANO-DE-INICIO'] = arg.attributes['ANO-DE-INICIO']
		@atributos['ANO-DE-CONCLUSAO'] = arg.attributes['ANO-DE-CONCLUSAO']

		@elementos = Hash.new
	end


end


class EnsinoMedioSegundoGrau

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FORMACAO'] = arg.attributes['SEQUENCIA-FORMACAO']
		@atributos['NIVEL'] = arg.attributes['NIVEL']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['STATUS-DO-CURSO'] = arg.attributes['STATUS-DO-CURSO']
		@atributos['ANO-DE-INICIO'] = arg.attributes['ANO-DE-INICIO']
		@atributos['ANO-DE-CONCLUSAO'] = arg.attributes['ANO-DE-CONCLUSAO']

		@elementos = Hash.new
	end


end


class Graduacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FORMACAO'] = arg.attributes['SEQUENCIA-FORMACAO']
		@atributos['NIVEL'] = arg.attributes['NIVEL']
		@atributos['TITULO-DO-TRABALHO-DE-CONCLUSAO-DE-CURSO'] = arg.attributes['TITULO-DO-TRABALHO-DE-CONCLUSAO-DE-CURSO']
		@atributos['NOME-DO-ORIENTADOR'] = arg.attributes['NOME-DO-ORIENTADOR']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['CODIGO-AREA-CURSO'] = arg.attributes['CODIGO-AREA-CURSO']
		@atributos['STATUS-DO-CURSO'] = arg.attributes['STATUS-DO-CURSO']
		@atributos['ANO-DE-INICIO'] = arg.attributes['ANO-DE-INICIO']
		@atributos['ANO-DE-CONCLUSAO'] = arg.attributes['ANO-DE-CONCLUSAO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-AGENCIA'] = arg.attributes['NOME-AGENCIA']
		@atributos['NUMERO-ID-ORIENTADOR'] = arg.attributes['NUMERO-ID-ORIENTADOR']
		@atributos['CODIGO-CURSO-CAPES'] = arg.attributes['CODIGO-CURSO-CAPES']
		@atributos['TITULO-DO-TRABALHO-DE-CONCLUSAO-DE-CURSO-INGLES'] = arg.attributes['TITULO-DO-TRABALHO-DE-CONCLUSAO-DE-CURSO-INGLES']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']
		@atributos['FORMACAO-ACADEMICA-TITULACAO'] = arg.attributes['FORMACAO-ACADEMICA-TITULACAO']
		@atributos['TIPO-GRADUACAO'] = arg.attributes['TIPO-GRADUACAO']
		@atributos['CODIGO-INSTITUICAO-GRAD'] = arg.attributes['CODIGO-INSTITUICAO-GRAD']
		@atributos['NOME-INSTITUICAO-GRAD'] = arg.attributes['NOME-INSTITUICAO-GRAD']
		@atributos['CODIGO-INSTITUICAO-OUTRA-GRAD'] = arg.attributes['CODIGO-INSTITUICAO-OUTRA-GRAD']
		@atributos['NOME-INSTITUICAO-OUTRA-GRAD'] = arg.attributes['NOME-INSTITUICAO-OUTRA-GRAD']
		@atributos['NOME-ORIENTADOR-GRAD'] = arg.attributes['NOME-ORIENTADOR-GRAD']

		@elementos = Hash.new
	end


end


class Aperfeicoamento

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FORMACAO'] = arg.attributes['SEQUENCIA-FORMACAO']
		@atributos['NIVEL'] = arg.attributes['NIVEL']
		@atributos['TITULO-DA-MONOGRAFIA'] = arg.attributes['TITULO-DA-MONOGRAFIA']
		@atributos['NOME-DO-ORIENTADOR'] = arg.attributes['NOME-DO-ORIENTADOR']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['CODIGO-AREA-CURSO'] = arg.attributes['CODIGO-AREA-CURSO']
		@atributos['STATUS-DO-CURSO'] = arg.attributes['STATUS-DO-CURSO']
		@atributos['ANO-DE-INICIO'] = arg.attributes['ANO-DE-INICIO']
		@atributos['ANO-DE-CONCLUSAO'] = arg.attributes['ANO-DE-CONCLUSAO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-AGENCIA'] = arg.attributes['NOME-AGENCIA']
		@atributos['CARGA-HORARIA'] = arg.attributes['CARGA-HORARIA']
		@atributos['TITULO-DA-MONOGRAFIA-INGLES'] = arg.attributes['TITULO-DA-MONOGRAFIA-INGLES']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class Especializacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FORMACAO'] = arg.attributes['SEQUENCIA-FORMACAO']
		@atributos['NIVEL'] = arg.attributes['NIVEL']
		@atributos['TITULO-DA-MONOGRAFIA'] = arg.attributes['TITULO-DA-MONOGRAFIA']
		@atributos['NOME-DO-ORIENTADOR'] = arg.attributes['NOME-DO-ORIENTADOR']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['STATUS-DO-CURSO'] = arg.attributes['STATUS-DO-CURSO']
		@atributos['ANO-DE-INICIO'] = arg.attributes['ANO-DE-INICIO']
		@atributos['ANO-DE-CONCLUSAO'] = arg.attributes['ANO-DE-CONCLUSAO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-AGENCIA'] = arg.attributes['NOME-AGENCIA']
		@atributos['CARGA-HORARIA'] = arg.attributes['CARGA-HORARIA']
		@atributos['TITULO-DA-MONOGRAFIA-INGLES'] = arg.attributes['TITULO-DA-MONOGRAFIA-INGLES']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class Mestrado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FORMACAO'] = arg.attributes['SEQUENCIA-FORMACAO']
		@atributos['NIVEL'] = arg.attributes['NIVEL']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['CODIGO-AREA-CURSO'] = arg.attributes['CODIGO-AREA-CURSO']
		@atributos['STATUS-DO-CURSO'] = arg.attributes['STATUS-DO-CURSO']
		@atributos['ANO-DE-INICIO'] = arg.attributes['ANO-DE-INICIO']
		@atributos['ANO-DE-CONCLUSAO'] = arg.attributes['ANO-DE-CONCLUSAO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-AGENCIA'] = arg.attributes['NOME-AGENCIA']
		@atributos['ANO-DE-OBTENCAO-DO-TITULO'] = arg.attributes['ANO-DE-OBTENCAO-DO-TITULO']
		@atributos['TITULO-DA-DISSERTACAO-TESE'] = arg.attributes['TITULO-DA-DISSERTACAO-TESE']
		@atributos['NOME-COMPLETO-DO-ORIENTADOR'] = arg.attributes['NOME-COMPLETO-DO-ORIENTADOR']
		@atributos['TIPO-MESTRADO'] = arg.attributes['TIPO-MESTRADO']
		@atributos['NUMERO-ID-ORIENTADOR'] = arg.attributes['NUMERO-ID-ORIENTADOR']
		@atributos['CODIGO-CURSO-CAPES'] = arg.attributes['CODIGO-CURSO-CAPES']
		@atributos['TITULO-DA-DISSERTACAO-TESE-INGLES'] = arg.attributes['TITULO-DA-DISSERTACAO-TESE-INGLES']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']
		@atributos['NOME-DO-CO-ORIENTADOR'] = arg.attributes['NOME-DO-CO-ORIENTADOR']
		@atributos['CODIGO-INSTITUICAO-DOUT'] = arg.attributes['CODIGO-INSTITUICAO-DOUT']
		@atributos['NOME-INSTITUICAO-DOUT'] = arg.attributes['NOME-INSTITUICAO-DOUT']
		@atributos['CODIGO-INSTITUICAO-OUTRA-DOUT'] = arg.attributes['CODIGO-INSTITUICAO-OUTRA-DOUT']
		@atributos['NOME-INSTITUICAO-OUTRA-DOUT'] = arg.attributes['NOME-INSTITUICAO-OUTRA-DOUT']
		@atributos['NOME-ORIENTADOR-DOUT'] = arg.attributes['NOME-ORIENTADOR-DOUT']

		@elementos = Hash.new
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
	end


end


class MestradoProfissionalizante

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FORMACAO'] = arg.attributes['SEQUENCIA-FORMACAO']
		@atributos['NIVEL'] = arg.attributes['NIVEL']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['CODIGO-AREA-CURSO'] = arg.attributes['CODIGO-AREA-CURSO']
		@atributos['STATUS-DO-CURSO'] = arg.attributes['STATUS-DO-CURSO']
		@atributos['ANO-DE-INICIO'] = arg.attributes['ANO-DE-INICIO']
		@atributos['ANO-DE-CONCLUSAO'] = arg.attributes['ANO-DE-CONCLUSAO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-AGENCIA'] = arg.attributes['NOME-AGENCIA']
		@atributos['ANO-DE-OBTENCAO-DO-TITULO'] = arg.attributes['ANO-DE-OBTENCAO-DO-TITULO']
		@atributos['TITULO-DA-DISSERTACAO-TESE'] = arg.attributes['TITULO-DA-DISSERTACAO-TESE']
		@atributos['NOME-COMPLETO-DO-ORIENTADOR'] = arg.attributes['NOME-COMPLETO-DO-ORIENTADOR']
		@atributos['NUMERO-ID-ORIENTADOR'] = arg.attributes['NUMERO-ID-ORIENTADOR']
		@atributos['CODIGO-CURSO-CAPES'] = arg.attributes['CODIGO-CURSO-CAPES']
		@atributos['TITULO-DA-DISSERTACAO-TESE-INGLES'] = arg.attributes['TITULO-DA-DISSERTACAO-TESE-INGLES']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']
		@atributos['NOME-DO-CO-ORIENTADOR'] = arg.attributes['NOME-DO-CO-ORIENTADOR']

		@elementos = Hash.new
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
	end


end


class Doutorado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FORMACAO'] = arg.attributes['SEQUENCIA-FORMACAO']
		@atributos['NIVEL'] = arg.attributes['NIVEL']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['CODIGO-AREA-CURSO'] = arg.attributes['CODIGO-AREA-CURSO']
		@atributos['STATUS-DO-CURSO'] = arg.attributes['STATUS-DO-CURSO']
		@atributos['ANO-DE-INICIO'] = arg.attributes['ANO-DE-INICIO']
		@atributos['ANO-DE-CONCLUSAO'] = arg.attributes['ANO-DE-CONCLUSAO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-AGENCIA'] = arg.attributes['NOME-AGENCIA']
		@atributos['ANO-DE-OBTENCAO-DO-TITULO'] = arg.attributes['ANO-DE-OBTENCAO-DO-TITULO']
		@atributos['TITULO-DA-DISSERTACAO-TESE'] = arg.attributes['TITULO-DA-DISSERTACAO-TESE']
		@atributos['NOME-COMPLETO-DO-ORIENTADOR'] = arg.attributes['NOME-COMPLETO-DO-ORIENTADOR']
		@atributos['TIPO-DOUTORADO'] = arg.attributes['TIPO-DOUTORADO']
		@atributos['CODIGO-INSTITUICAO-DOUT'] = arg.attributes['CODIGO-INSTITUICAO-DOUT']
		@atributos['NOME-INSTITUICAO-DOUT'] = arg.attributes['NOME-INSTITUICAO-DOUT']
		@atributos['CODIGO-INSTITUICAO-OUTRA-DOUT'] = arg.attributes['CODIGO-INSTITUICAO-OUTRA-DOUT']
		@atributos['NOME-INSTITUICAO-OUTRA-DOUT'] = arg.attributes['NOME-INSTITUICAO-OUTRA-DOUT']
		@atributos['NOME-ORIENTADOR-DOUT'] = arg.attributes['NOME-ORIENTADOR-DOUT']
		@atributos['NUMERO-ID-ORIENTADOR'] = arg.attributes['NUMERO-ID-ORIENTADOR']
		@atributos['CODIGO-CURSO-CAPES'] = arg.attributes['CODIGO-CURSO-CAPES']
		@atributos['TITULO-DA-DISSERTACAO-TESE-INGLES'] = arg.attributes['TITULO-DA-DISSERTACAO-TESE-INGLES']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']
		@atributos['NOME-DO-ORIENTADOR-CO-TUTELA'] = arg.attributes['NOME-DO-ORIENTADOR-CO-TUTELA']
		@atributos['CODIGO-INSTITUICAO-OUTRA-CO-TUTELA'] = arg.attributes['CODIGO-INSTITUICAO-OUTRA-CO-TUTELA']
		@atributos['CODIGO-INSTITUICAO-CO-TUTELA'] = arg.attributes['CODIGO-INSTITUICAO-CO-TUTELA']
		@atributos['NOME-DO-ORIENTADOR-SANDUICHE'] = arg.attributes['NOME-DO-ORIENTADOR-SANDUICHE']
		@atributos['CODIGO-INSTITUICAO-OUTRA-SANDUICHE'] = arg.attributes['CODIGO-INSTITUICAO-OUTRA-SANDUICHE']
		@atributos['CODIGO-INSTITUICAO-SANDUICHE'] = arg.attributes['CODIGO-INSTITUICAO-SANDUICHE']
		@atributos['NOME-DO-CO-ORIENTADOR'] = arg.attributes['NOME-DO-CO-ORIENTADOR']

		@elementos = Hash.new
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
	end


end


class ResidenciaMedica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FORMACAO'] = arg.attributes['SEQUENCIA-FORMACAO']
		@atributos['NIVEL'] = arg.attributes['NIVEL']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['STATUS-DO-CURSO'] = arg.attributes['STATUS-DO-CURSO']
		@atributos['ANO-DE-INICIO'] = arg.attributes['ANO-DE-INICIO']
		@atributos['ANO-DE-CONCLUSAO'] = arg.attributes['ANO-DE-CONCLUSAO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-AGENCIA'] = arg.attributes['NOME-AGENCIA']
		@atributos['TITULO-DA-RESIDENCIA-MEDICA'] = arg.attributes['TITULO-DA-RESIDENCIA-MEDICA']
		@atributos['NUMERO-DO-REGISTRO'] = arg.attributes['NUMERO-DO-REGISTRO']
		@atributos['TITULO-DA-RESIDENCIA-MEDICA-INGLES'] = arg.attributes['TITULO-DA-RESIDENCIA-MEDICA-INGLES']

		@elementos = Hash.new
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
	end


end


class LivreDocencia

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FORMACAO'] = arg.attributes['SEQUENCIA-FORMACAO']
		@atributos['NIVEL'] = arg.attributes['NIVEL']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['ANO-DE-OBTENCAO-DO-TITULO'] = arg.attributes['ANO-DE-OBTENCAO-DO-TITULO']
		@atributos['TITULO-DO-TRABALHO'] = arg.attributes['TITULO-DO-TRABALHO']
		@atributos['TITULO-DO-TRABALHO-INGLES'] = arg.attributes['TITULO-DO-TRABALHO-INGLES']

		@elementos = Hash.new
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
	end


end


class PosDoutorado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FORMACAO'] = arg.attributes['SEQUENCIA-FORMACAO']
		@atributos['NIVEL'] = arg.attributes['NIVEL']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['ANO-DE-INICIO'] = arg.attributes['ANO-DE-INICIO']
		@atributos['ANO-DE-CONCLUSAO'] = arg.attributes['ANO-DE-CONCLUSAO']
		@atributos['ANO-DE-OBTENCAO-DO-TITULO'] = arg.attributes['ANO-DE-OBTENCAO-DO-TITULO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-AGENCIA'] = arg.attributes['NOME-AGENCIA']
		@atributos['STATUS-DO-ESTAGIO'] = arg.attributes['STATUS-DO-ESTAGIO']
		@atributos['STATUS-DO-CURSO'] = arg.attributes['STATUS-DO-CURSO']
		@atributos['NUMERO-ID-ORIENTADOR'] = arg.attributes['NUMERO-ID-ORIENTADOR']
		@atributos['CODIGO-CURSO-CAPES'] = arg.attributes['CODIGO-CURSO-CAPES']
		@atributos['TITULO-DO-TRABALHO'] = arg.attributes['TITULO-DO-TRABALHO']
		@atributos['TITULO-DO-TRABALHO-INGLES'] = arg.attributes['TITULO-DO-TRABALHO-INGLES']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
	end


end


class Disciplina

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-ESPECIFICACAO'] = arg.attributes['SEQUENCIA-ESPECIFICACAO']

		@elementos = Hash.new
	end


end


class LinhaPesquisa

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-LINHA'] = arg.attributes['SEQUENCIA-LINHA']
		@atributos['TITULO-DA-LINHA-DE-PESQUISA'] = arg.attributes['TITULO-DA-LINHA-DE-PESQUISA']
		@atributos['FLAG-LINHA-DE-PESQUISA-ATIVA'] = arg.attributes['FLAG-LINHA-DE-PESQUISA-ATIVA']
		@atributos['OBJETIVOS-LINHA-DE-PESQUISA'] = arg.attributes['OBJETIVOS-LINHA-DE-PESQUISA']
		@atributos['TITULO-DA-LINHA-DE-PESQUISA-INGLES'] = arg.attributes['TITULO-DA-LINHA-DE-PESQUISA-INGLES']
		@atributos['OBJETIVOS-LINHA-DE-PESQUISA-INGLES'] = arg.attributes['OBJETIVOS-LINHA-DE-PESQUISA-INGLES']

		@elementos = Hash.new
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
	end


end


class ProjetoPesquisa

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PROJETO'] = arg.attributes['SEQUENCIA-PROJETO']
		@atributos['ANO-INICIO'] = arg.attributes['ANO-INICIO']
		@atributos['ANO-FIM'] = arg.attributes['ANO-FIM']
		@atributos['NOME-DO-PROJETO'] = arg.attributes['NOME-DO-PROJETO']
		@atributos['SITUACAO'] = arg.attributes['SITUACAO']
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['NUMERO-GRADUACAO'] = arg.attributes['NUMERO-GRADUACAO']
		@atributos['NUMERO-ESPECIALIZACAO'] = arg.attributes['NUMERO-ESPECIALIZACAO']
		@atributos['NUMERO-MESTRADO-ACADEMICO'] = arg.attributes['NUMERO-MESTRADO-ACADEMICO']
		@atributos['NUMERO-MESTRADO-PROF'] = arg.attributes['NUMERO-MESTRADO-PROF']
		@atributos['NUMERO-DOUTORADO'] = arg.attributes['NUMERO-DOUTORADO']
		@atributos['DESCRICAO-DO-PROJETO'] = arg.attributes['DESCRICAO-DO-PROJETO']
		@atributos['IDENTIFICADOR-PROJETO'] = arg.attributes['IDENTIFICADOR-PROJETO']
		@atributos['DESCRICAO-DO-PROJETO-INGLES'] = arg.attributes['DESCRICAO-DO-PROJETO-INGLES']
		@atributos['NOME-DO-PROJETO-INGLES'] = arg.attributes['NOME-DO-PROJETO-INGLES']
		@atributos['FLAG-POTENCIAL-INOVACAO'] = arg.attributes['FLAG-POTENCIAL-INOVACAO']
		@atributos['FLAG-PROJETO-CERTIFICADO'] = arg.attributes['FLAG-PROJETO-CERTIFICADO']
		@atributos['NOME-COORDENADOR-CERTIFICACAO'] = arg.attributes['NOME-COORDENADOR-CERTIFICACAO']
		@atributos['FORMATO-DATA-CERTIFICACAO'] = arg.attributes['FORMATO-DATA-CERTIFICACAO']
		@atributos['DATA-CERTIFICACAO'] = arg.attributes['DATA-CERTIFICACAO']
		@atributos['NUMERO_TECNICO_NIVEL_MEDIO'] = arg.attributes['NUMERO_TECNICO_NIVEL_MEDIO']

		@elementos = Hash.new
		@elementos['EQUIPE-DO-PROJETO'] = EquipeProjeto.new(arg.elements['EQUIPE-DO-PROJETO'])
		@elementos['FINANCIADORES-DO-PROJETO'] = FinanciadoresProjeto.new(arg.elements['FINANCIADORES-DO-PROJETO'])
		@elementos['PRODUCOES-CT-DO-PROJETO'] = ProducoesCtProjeto.new(arg.elements['PRODUCOES-CT-DO-PROJETO'])
		@elementos['ORIENTACOES'] = Orientacoes.new(arg.elements['ORIENTACOES'])
	end


end


class EquipeProjeto

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['INTEGRANTES-DO-PROJETO'] = Array.new
		arg.elements.each('INTEGRANTES-DO-PROJETO') do | i |
			@elementos['INTEGRANTES-DO-PROJETO'].push(IntegrantesProjeto.new(i))
		end
	end


end


class IntegrantesProjeto

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-COMPLETO'] = arg.attributes['NOME-COMPLETO']
		@atributos['NOME-PARA-CITACAO'] = arg.attributes['NOME-PARA-CITACAO']
		@atributos['ORDEM-DE-INTEGRACAO'] = arg.attributes['ORDEM-DE-INTEGRACAO']
		@atributos['FLAG-RESPONSAVEL'] = arg.attributes['FLAG-RESPONSAVEL']
		@atributos['NRO-ID-CNPQ'] = arg.attributes['NRO-ID-CNPQ']

		@elementos = Hash.new
	end


end


class FinanciadoresProjeto

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['FINANCIADOR-DO-PROJETO'] = Array.new
		arg.elements.each('FINANCIADOR-DO-PROJETO') do | i |
			@elementos['FINANCIADOR-DO-PROJETO'].push(FinanciadorProjeto.new(i))
		end
	end


end


class FinanciadorProjeto

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FINANCIADOR'] = arg.attributes['SEQUENCIA-FINANCIADOR']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']

		@elementos = Hash.new
	end


end


class ProducoesCtProjeto

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['PRODUCAO-CT-DO-PROJETO'] = Array.new
		arg.elements.each('PRODUCAO-CT-DO-PROJETO') do | i |
			@elementos['PRODUCAO-CT-DO-PROJETO'].push(ProducaoCtProjeto.new(i))
		end
	end


end


class ProducaoCtProjeto

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO-CT'] = arg.attributes['SEQUENCIA-PRODUCAO-CT']
		@atributos['TITULO-DA-PRODUCAO-CT'] = arg.attributes['TITULO-DA-PRODUCAO-CT']
		@atributos['TIPO-PRODUCAO-CT'] = arg.attributes['TIPO-PRODUCAO-CT']
		@atributos['TITULO-DA-PRODUCAO-CT-INGLES'] = arg.attributes['TITULO-DA-PRODUCAO-CT-INGLES']

		@elementos = Hash.new
	end


end


class Orientacoes

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['ORIENTACAO'] = Array.new
		arg.elements.each('ORIENTACAO') do | i |
			@elementos['ORIENTACAO'].push(Orientacao.new(i))
		end
	end


end


class Orientacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-ORIENTACAO'] = arg.attributes['SEQUENCIA-ORIENTACAO']
		@atributos['TITULO-ORIENTACAO'] = arg.attributes['TITULO-ORIENTACAO']
		@atributos['TIPO-ORIENTACAO'] = arg.attributes['TIPO-ORIENTACAO']
		@atributos['TITULO-ORIENTACAO-INGLES'] = arg.attributes['TITULO-ORIENTACAO-INGLES']

		@elementos = Hash.new
	end


end


class Treinamento

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-ESPECIFICACAO'] = arg.attributes['SEQUENCIA-ESPECIFICACAO']

		@elementos = Hash.new
	end


end


class AtuacoesProfissionais

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['ATUACAO-PROFISSIONAL'] = Array.new
		arg.elements.each('ATUACAO-PROFISSIONAL') do | i |
			@elementos['ATUACAO-PROFISSIONAL'].push(AtuacaoProfissional.new(i))
		end
	end


end


class AtuacaoProfissional

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['SEQUENCIA-ATIVIDADE'] = arg.attributes['SEQUENCIA-ATIVIDADE']
		@atributos['SEQUENCIA-IMPORTANCIA'] = arg.attributes['SEQUENCIA-IMPORTANCIA']

		@elementos = Hash.new
		@elementos['VINCULOS'] = Array.new
		arg.elements.each('VINCULOS') do | i |
			@elementos['VINCULOS'].push(Vinculos.new(i))
		end
		@elementos['ATIVIDADES-DE-DIRECAO-E-ADMINISTRACAO'] = AtividadesDirecaoAdministracao.new(arg.elements['ATIVIDADES-DE-DIRECAO-E-ADMINISTRACAO'])
		@elementos['ATIVIDADES-DE-PESQUISA-E-DESENVOLVIMENTO'] = AtividadesPesquisaDesenvolvimento.new(arg.elements['ATIVIDADES-DE-PESQUISA-E-DESENVOLVIMENTO'])
		@elementos['ATIVIDADES-DE-ENSINO'] = AtividadesEnsino.new(arg.elements['ATIVIDADES-DE-ENSINO'])
		@elementos['ATIVIDADES-DE-ESTAGIO'] = AtividadesEstagio.new(arg.elements['ATIVIDADES-DE-ESTAGIO'])
		@elementos['ATIVIDADES-DE-SERVICO-TECNICO-ESPECIALIZADO'] = AtividadesServicoTecnicoEspecializado.new(arg.elements['ATIVIDADES-DE-SERVICO-TECNICO-ESPECIALIZADO'])
		@elementos['ATIVIDADES-DE-EXTENSAO-UNIVERSITARIA'] = AtividadesExtensaoUniversitaria.new(arg.elements['ATIVIDADES-DE-EXTENSAO-UNIVERSITARIA'])
		@elementos['ATIVIDADES-DE-TREINAMENTO-MINISTRADO'] = AtividadesTreinamentoMinistrado.new(arg.elements['ATIVIDADES-DE-TREINAMENTO-MINISTRADO'])
		@elementos['OUTRAS-ATIVIDADES-TECNICO-CIENTIFICA'] = OutrasAtividadesTecnicoCientifica.new(arg.elements['OUTRAS-ATIVIDADES-TECNICO-CIENTIFICA'])
		@elementos['ATIVIDADES-DE-CONSELHO-COMISSAO-E-CONSULTORIA'] = AtividadesConselhoComissaoConsultoria.new(arg.elements['ATIVIDADES-DE-CONSELHO-COMISSAO-E-CONSULTORIA'])
		@elementos['ATIVIDADES-DE-PARTICIPACAO-EM-PROJETO'] = AtividadesParticipacaoProjeto.new(arg.elements['ATIVIDADES-DE-PARTICIPACAO-EM-PROJETO'])
	end


end


class Vinculos

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-HISTORICO'] = arg.attributes['SEQUENCIA-HISTORICO']
		@atributos['TIPO-DE-VINCULO'] = arg.attributes['TIPO-DE-VINCULO']
		@atributos['ENQUADRAMENTO-FUNCIONAL'] = arg.attributes['ENQUADRAMENTO-FUNCIONAL']
		@atributos['CARGA-HORARIA-SEMANAL'] = arg.attributes['CARGA-HORARIA-SEMANAL']
		@atributos['FLAG-DEDICACAO-EXCLUSIVA'] = arg.attributes['FLAG-DEDICACAO-EXCLUSIVA']
		@atributos['MES-INICIO'] = arg.attributes['MES-INICIO']
		@atributos['ANO-INICIO'] = arg.attributes['ANO-INICIO']
		@atributos['MES-FIM'] = arg.attributes['MES-FIM']
		@atributos['ANO-FIM'] = arg.attributes['ANO-FIM']
		@atributos['OUTRAS-INFORMACOES'] = arg.attributes['OUTRAS-INFORMACOES']
		@atributos['FLAG-VINCULO-EMPREGATICIO'] = arg.attributes['FLAG-VINCULO-EMPREGATICIO']
		@atributos['OUTRO-VINCULO-INFORMADO'] = arg.attributes['OUTRO-VINCULO-INFORMADO']
		@atributos['OUTRO-ENQUADRAMENTO-FUNCIONAL-INFORMADO'] = arg.attributes['OUTRO-ENQUADRAMENTO-FUNCIONAL-INFORMADO']
		@atributos['OUTRO-ENQUADRAMENTO-FUNCIONAL-INFORMADO-INGLES'] = arg.attributes['OUTRO-ENQUADRAMENTO-FUNCIONAL-INFORMADO-INGLES']
		@atributos['OUTRAS-INFORMACOES-INGLES'] = arg.attributes['OUTRAS-INFORMACOES-INGLES']

		@elementos = Hash.new
	end


end


class AtividadesDirecaoAdministracao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['DIRECAO-E-ADMINISTRACAO'] = Array.new
		arg.elements.each('DIRECAO-E-ADMINISTRACAO') do | i |
			@elementos['DIRECAO-E-ADMINISTRACAO'].push(DirecaoAdministracao.new(i))
		end
	end


end


class DirecaoAdministracao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FUNCAO-ATIVIDADE'] = arg.attributes['SEQUENCIA-FUNCAO-ATIVIDADE']
		@atributos['FLAG-PERIODO'] = arg.attributes['FLAG-PERIODO']
		@atributos['MES-INICIO'] = arg.attributes['MES-INICIO']
		@atributos['ANO-INICIO'] = arg.attributes['ANO-INICIO']
		@atributos['MES-FIM'] = arg.attributes['MES-FIM']
		@atributos['ANO-FIM'] = arg.attributes['ANO-FIM']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-UNIDADE'] = arg.attributes['CODIGO-UNIDADE']
		@atributos['FORMATO-CARGO-OU-FUNCAO'] = arg.attributes['FORMATO-CARGO-OU-FUNCAO']
		@atributos['CARGO-OU-FUNCAO'] = arg.attributes['CARGO-OU-FUNCAO']
		@atributos['NOME-UNIDADE'] = arg.attributes['NOME-UNIDADE']
		@atributos['CARGO-OU-FUNCAO-INGLES'] = arg.attributes['CARGO-OU-FUNCAO-INGLES']

		@elementos = Hash.new
	end


end


class AtividadesPesquisaDesenvolvimento

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['PESQUISA-E-DESENVOLVIMENTO'] = Array.new
		arg.elements.each('PESQUISA-E-DESENVOLVIMENTO') do | i |
			@elementos['PESQUISA-E-DESENVOLVIMENTO'].push(PesquisaDesenvolvimento.new(i))
		end
	end


end


class PesquisaDesenvolvimento

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FUNCAO-ATIVIDADE'] = arg.attributes['SEQUENCIA-FUNCAO-ATIVIDADE']
		@atributos['FLAG-PERIODO'] = arg.attributes['FLAG-PERIODO']
		@atributos['MES-INICIO'] = arg.attributes['MES-INICIO']
		@atributos['ANO-INICIO'] = arg.attributes['ANO-INICIO']
		@atributos['MES-FIM'] = arg.attributes['MES-FIM']
		@atributos['ANO-FIM'] = arg.attributes['ANO-FIM']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-UNIDADE'] = arg.attributes['CODIGO-UNIDADE']
		@atributos['NOME-UNIDADE'] = arg.attributes['NOME-UNIDADE']

		@elementos = Hash.new
		@elementos['LINHA-DE-PESQUISA'] = Array.new
		arg.elements.each('LINHA-DE-PESQUISA') do | i |
			@elementos['LINHA-DE-PESQUISA'].push(LinhaPesquisa.new(i))
		end
	end


end


class AtividadesEnsino

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['ENSINO'] = Array.new
		arg.elements.each('ENSINO') do | i |
			@elementos['ENSINO'].push(Ensino.new(i))
		end
	end


end


class Ensino

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FUNCAO-ATIVIDADE'] = arg.attributes['SEQUENCIA-FUNCAO-ATIVIDADE']
		@atributos['FLAG-PERIODO'] = arg.attributes['FLAG-PERIODO']
		@atributos['TIPO-ENSINO'] = arg.attributes['TIPO-ENSINO']
		@atributos['MES-INICIO'] = arg.attributes['MES-INICIO']
		@atributos['ANO-INICIO'] = arg.attributes['ANO-INICIO']
		@atributos['MES-FIM'] = arg.attributes['MES-FIM']
		@atributos['ANO-FIM'] = arg.attributes['ANO-FIM']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
		@elementos['DISCIPLINA'] = Array.new
		arg.elements.each('DISCIPLINA') do | i |
			@elementos['DISCIPLINA'].push(Disciplina.new(i))
		end
	end


end


class AtividadesEstagio

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['ESTAGIO'] = Array.new
		arg.elements.each('ESTAGIO') do | i |
			@elementos['ESTAGIO'].push(Estagio.new(i))
		end
	end


end


class Estagio

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FUNCAO-ATIVIDADE'] = arg.attributes['SEQUENCIA-FUNCAO-ATIVIDADE']
		@atributos['FLAG-PERIODO'] = arg.attributes['FLAG-PERIODO']
		@atributos['MES-INICIO'] = arg.attributes['MES-INICIO']
		@atributos['ANO-INICIO'] = arg.attributes['ANO-INICIO']
		@atributos['MES-FIM'] = arg.attributes['MES-FIM']
		@atributos['ANO-FIM'] = arg.attributes['ANO-FIM']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-UNIDADE'] = arg.attributes['CODIGO-UNIDADE']
		@atributos['NOME-UNIDADE'] = arg.attributes['NOME-UNIDADE']
		@atributos['ESTAGIO-REALIZADO'] = arg.attributes['ESTAGIO-REALIZADO']

		@elementos = Hash.new
	end


end


class AtividadesServicoTecnicoEspecializado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['SERVICO-TECNICO-ESPECIALIZADO'] = Array.new
		arg.elements.each('SERVICO-TECNICO-ESPECIALIZADO') do | i |
			@elementos['SERVICO-TECNICO-ESPECIALIZADO'].push(ServicoTecnicoEspecializado.new(i))
		end
	end


end


class ServicoTecnicoEspecializado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FUNCAO-ATIVIDADE'] = arg.attributes['SEQUENCIA-FUNCAO-ATIVIDADE']
		@atributos['FLAG-PERIODO'] = arg.attributes['FLAG-PERIODO']
		@atributos['MES-INICIO'] = arg.attributes['MES-INICIO']
		@atributos['ANO-INICIO'] = arg.attributes['ANO-INICIO']
		@atributos['MES-FIM'] = arg.attributes['MES-FIM']
		@atributos['ANO-FIM'] = arg.attributes['ANO-FIM']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-UNIDADE'] = arg.attributes['CODIGO-UNIDADE']
		@atributos['NOME-UNIDADE'] = arg.attributes['NOME-UNIDADE']
		@atributos['SERVICO-REALIZADO'] = arg.attributes['SERVICO-REALIZADO']

		@elementos = Hash.new
	end


end


class AtividadesExtensaoUniversitaria

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['EXTENSAO-UNIVERSITARIA'] = Array.new
		arg.elements.each('EXTENSAO-UNIVERSITARIA') do | i |
			@elementos['EXTENSAO-UNIVERSITARIA'].push(ExtensaoUniversitaria.new(i))
		end
	end


end


class ExtensaoUniversitaria

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FUNCAO-ATIVIDADE'] = arg.attributes['SEQUENCIA-FUNCAO-ATIVIDADE']
		@atributos['FLAG-PERIODO'] = arg.attributes['FLAG-PERIODO']
		@atributos['MES-INICIO'] = arg.attributes['MES-INICIO']
		@atributos['ANO-INICIO'] = arg.attributes['ANO-INICIO']
		@atributos['MES-FIM'] = arg.attributes['MES-FIM']
		@atributos['ANO-FIM'] = arg.attributes['ANO-FIM']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-UNIDADE'] = arg.attributes['CODIGO-UNIDADE']
		@atributos['NOME-UNIDADE'] = arg.attributes['NOME-UNIDADE']
		@atributos['ATIVIDADE-DE-EXTENSAO-REALIZADA'] = arg.attributes['ATIVIDADE-DE-EXTENSAO-REALIZADA']

		@elementos = Hash.new
	end


end


class AtividadesTreinamentoMinistrado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['TREINAMENTO-MINISTRADO'] = Array.new
		arg.elements.each('TREINAMENTO-MINISTRADO') do | i |
			@elementos['TREINAMENTO-MINISTRADO'].push(TreinamentoMinistrado.new(i))
		end
	end


end


class TreinamentoMinistrado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FUNCAO-ATIVIDADE'] = arg.attributes['SEQUENCIA-FUNCAO-ATIVIDADE']
		@atributos['FLAG-PERIODO'] = arg.attributes['FLAG-PERIODO']
		@atributos['MES-INICIO'] = arg.attributes['MES-INICIO']
		@atributos['ANO-INICIO'] = arg.attributes['ANO-INICIO']
		@atributos['MES-FIM'] = arg.attributes['MES-FIM']
		@atributos['ANO-FIM'] = arg.attributes['ANO-FIM']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-UNIDADE'] = arg.attributes['CODIGO-UNIDADE']
		@atributos['NOME-UNIDADE'] = arg.attributes['NOME-UNIDADE']

		@elementos = Hash.new
		@elementos['TREINAMENTO'] = Array.new
		arg.elements.each('TREINAMENTO') do | i |
			@elementos['TREINAMENTO'].push(Treinamento.new(i))
		end
	end


end


class OutrasAtividadesTecnicoCientifica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['OUTRA-ATIVIDADE-TECNICO-CIENTIFICA'] = Array.new
		arg.elements.each('OUTRA-ATIVIDADE-TECNICO-CIENTIFICA') do | i |
			@elementos['OUTRA-ATIVIDADE-TECNICO-CIENTIFICA'].push(OutraAtividadeTecnicoCientifica.new(i))
		end
	end


end


class OutraAtividadeTecnicoCientifica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FUNCAO-ATIVIDADE'] = arg.attributes['SEQUENCIA-FUNCAO-ATIVIDADE']
		@atributos['FLAG-PERIODO'] = arg.attributes['FLAG-PERIODO']
		@atributos['MES-INICIO'] = arg.attributes['MES-INICIO']
		@atributos['ANO-INICIO'] = arg.attributes['ANO-INICIO']
		@atributos['MES-FIM'] = arg.attributes['MES-FIM']
		@atributos['ANO-FIM'] = arg.attributes['ANO-FIM']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-UNIDADE'] = arg.attributes['CODIGO-UNIDADE']
		@atributos['ATIVIDADE-REALIZADA'] = arg.attributes['ATIVIDADE-REALIZADA']
		@atributos['NOME-UNIDADE'] = arg.attributes['NOME-UNIDADE']

		@elementos = Hash.new
	end


end


class AtividadesConselhoComissaoConsultoria

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['CONSELHO-COMISSAO-E-CONSULTORIA'] = Array.new
		arg.elements.each('CONSELHO-COMISSAO-E-CONSULTORIA') do | i |
			@elementos['CONSELHO-COMISSAO-E-CONSULTORIA'].push(ConselhoComissaoConsultoria.new(i))
		end
	end


end


class ConselhoComissaoConsultoria

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FUNCAO-ATIVIDADE'] = arg.attributes['SEQUENCIA-FUNCAO-ATIVIDADE']
		@atributos['FLAG-PERIODO'] = arg.attributes['FLAG-PERIODO']
		@atributos['MES-INICIO'] = arg.attributes['MES-INICIO']
		@atributos['ANO-INICIO'] = arg.attributes['ANO-INICIO']
		@atributos['MES-FIM'] = arg.attributes['MES-FIM']
		@atributos['ANO-FIM'] = arg.attributes['ANO-FIM']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-UNIDADE'] = arg.attributes['CODIGO-UNIDADE']
		@atributos['NOME-UNIDADE'] = arg.attributes['NOME-UNIDADE']
		@atributos['ESPECIFICACAO'] = arg.attributes['ESPECIFICACAO']

		@elementos = Hash.new
	end


end


class AreasAtuacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['AREA-DE-ATUACAO'] = Array.new
		arg.elements.each('AREA-DE-ATUACAO') do | i |
			@elementos['AREA-DE-ATUACAO'].push(AreaAtuacao.new(i))
		end
	end


end


class AreaAtuacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-AREA-DE-ATUACAO'] = arg.attributes['SEQUENCIA-AREA-DE-ATUACAO']
		@atributos['NOME-GRANDE-AREA-DO-CONHECIMENTO'] = arg.attributes['NOME-GRANDE-AREA-DO-CONHECIMENTO']
		@atributos['NOME-DA-AREA-DO-CONHECIMENTO'] = arg.attributes['NOME-DA-AREA-DO-CONHECIMENTO']
		@atributos['NOME-DA-SUB-AREA-DO-CONHECIMENTO'] = arg.attributes['NOME-DA-SUB-AREA-DO-CONHECIMENTO']
		@atributos['NOME-DA-ESPECIALIDADE'] = arg.attributes['NOME-DA-ESPECIALIDADE']

		@elementos = Hash.new
	end


end


class Idioma

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['DESCRICAO-DO-IDIOMA'] = arg.attributes['DESCRICAO-DO-IDIOMA']
		@atributos['PROFICIENCIA-DE-LEITURA'] = arg.attributes['PROFICIENCIA-DE-LEITURA']
		@atributos['PROFICIENCIA-DE-FALA'] = arg.attributes['PROFICIENCIA-DE-FALA']
		@atributos['PROFICIENCIA-DE-ESCRITA'] = arg.attributes['PROFICIENCIA-DE-ESCRITA']
		@atributos['PROFICIENCIA-DE-COMPREENSAO'] = arg.attributes['PROFICIENCIA-DE-COMPREENSAO']

		@elementos = Hash.new
	end


end


class PremiosTitulos

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['PREMIO-TITULO'] = Array.new
		arg.elements.each('PREMIO-TITULO') do | i |
			@elementos['PREMIO-TITULO'].push(PremioTitulo.new(i))
		end
	end


end


class PremioTitulo

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-PREMIO-OU-TITULO'] = arg.attributes['NOME-DO-PREMIO-OU-TITULO']
		@atributos['NOME-DA-ENTIDADE-PROMOTORA'] = arg.attributes['NOME-DA-ENTIDADE-PROMOTORA']
		@atributos['ANO-DA-PREMIACAO'] = arg.attributes['ANO-DA-PREMIACAO']
		@atributos['NOME-DO-PREMIO-OU-TITULO-INGLES'] = arg.attributes['NOME-DO-PREMIO-OU-TITULO-INGLES']

		@elementos = Hash.new
	end


end


class AtividadesParticipacaoProjeto

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['PARTICIPACAO-EM-PROJETO'] = Array.new
		arg.elements.each('PARTICIPACAO-EM-PROJETO') do | i |
			@elementos['PARTICIPACAO-EM-PROJETO'].push(ParticipacaoProjeto.new(i))
		end
	end


end


class ParticipacaoProjeto

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FUNCAO-ATIVIDADE'] = arg.attributes['SEQUENCIA-FUNCAO-ATIVIDADE']
		@atributos['FLAG-PERIODO'] = arg.attributes['FLAG-PERIODO']
		@atributos['MES-INICIO'] = arg.attributes['MES-INICIO']
		@atributos['ANO-INICIO'] = arg.attributes['ANO-INICIO']
		@atributos['MES-FIM'] = arg.attributes['MES-FIM']
		@atributos['ANO-FIM'] = arg.attributes['ANO-FIM']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-UNIDADE'] = arg.attributes['CODIGO-UNIDADE']
		@atributos['NOME-UNIDADE'] = arg.attributes['NOME-UNIDADE']

		@elementos = Hash.new
		@elementos['PROJETO-DE-PESQUISA'] = Array.new
		arg.elements.each('PROJETO-DE-PESQUISA') do | i |
			@elementos['PROJETO-DE-PESQUISA'].push(ProjetoPesquisa.new(i))
		end
	end


end


class ProducaoBibliografica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['TRABALHOS-EM-EVENTOS'] = TrabalhosEventos.new(arg.elements['TRABALHOS-EM-EVENTOS'])
		@elementos['ARTIGOS-PUBLICADOS'] = ArtigosPublicados.new(arg.elements['ARTIGOS-PUBLICADOS'])
		@elementos['LIVROS-E-CAPITULOS'] = LivrosCapitulos.new(arg.elements['LIVROS-E-CAPITULOS'])
		@elementos['TEXTOS-EM-JORNAIS-OU-REVISTAS'] = TextosJornaisRevistas.new(arg.elements['TEXTOS-EM-JORNAIS-OU-REVISTAS'])
		@elementos['DEMAIS-TIPOS-DE-PRODUCAO-BIBLIOGRAFICA'] = DemaisTiposProducaoBibliografica.new(arg.elements['DEMAIS-TIPOS-DE-PRODUCAO-BIBLIOGRAFICA'])
		@elementos['ARTIGOS-ACEITOS-PARA-PUBLICACAO'] = ArtigosAceitosParaPublicacao.new(arg.elements['ARTIGOS-ACEITOS-PARA-PUBLICACAO'])
	end

		def toTEX
			puts '\subsection*{Producao Bibliografica}'
			@elementos['TRABALHOS-EM-EVENTOS'].toTEX
			@elementos['ARTIGOS-PUBLICADOS'].toTEX
			@elementos['LIVROS-E-CAPITULOS'].toTEX
			@elementos['TEXTOS-EM-JORNAIS-OU-REVISTAS'].toTEX
			@elementos['ARTIGOS-ACEITOS-PARA-PUBLICACAO'].toTEX
		end

end


class TrabalhosEventos

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['TRABALHO-EM-EVENTOS'] = Array.new
		arg.elements.each('TRABALHO-EM-EVENTOS') do | i |
			@elementos['TRABALHO-EM-EVENTOS'].push(TrabalhoEventos.new(i))
		end
	end


end


class TrabalhoEventos

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DO-TRABALHO'] = DadosBasicosTrabalho.new(arg.elements['DADOS-BASICOS-DO-TRABALHO'])
		@elementos['DETALHAMENTO-DO-TRABALHO'] = DetalhamentoTrabalho.new(arg.elements['DETALHAMENTO-DO-TRABALHO'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosTrabalho

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO-DO-TRABALHO'] = arg.attributes['TITULO-DO-TRABALHO']
		@atributos['ANO-DO-TRABALHO'] = arg.attributes['ANO-DO-TRABALHO']
		@atributos['PAIS-DO-EVENTO'] = arg.attributes['PAIS-DO-EVENTO']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-DO-TRABALHO-INGLES'] = arg.attributes['TITULO-DO-TRABALHO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoTrabalho

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['CLASSIFICACAO-DO-EVENTO'] = arg.attributes['CLASSIFICACAO-DO-EVENTO']
		@atributos['NOME-DO-EVENTO'] = arg.attributes['NOME-DO-EVENTO']
		@atributos['CIDADE-DO-EVENTO'] = arg.attributes['CIDADE-DO-EVENTO']
		@atributos['ANO-DE-REALIZACAO'] = arg.attributes['ANO-DE-REALIZACAO']
		@atributos['TITULO-DOS-ANAIS-OU-PROCEEDINGS'] = arg.attributes['TITULO-DOS-ANAIS-OU-PROCEEDINGS']
		@atributos['VOLUME'] = arg.attributes['VOLUME']
		@atributos['FASCICULO'] = arg.attributes['FASCICULO']
		@atributos['SERIE'] = arg.attributes['SERIE']
		@atributos['PAGINA-INICIAL'] = arg.attributes['PAGINA-INICIAL']
		@atributos['PAGINA-FINAL'] = arg.attributes['PAGINA-FINAL']
		@atributos['ISBN'] = arg.attributes['ISBN']
		@atributos['NOME-DA-EDITORA'] = arg.attributes['NOME-DA-EDITORA']
		@atributos['CIDADE-DA-EDITORA'] = arg.attributes['CIDADE-DA-EDITORA']
		@atributos['NOME-DO-EVENTO-INGLES'] = arg.attributes['NOME-DO-EVENTO-INGLES']

		@elementos = Hash.new
	end


end


class Autores

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-COMPLETO-DO-AUTOR'] = arg.attributes['NOME-COMPLETO-DO-AUTOR']
		@atributos['NOME-PARA-CITACAO'] = arg.attributes['NOME-PARA-CITACAO']
		@atributos['ORDEM-DE-AUTORIA'] = arg.attributes['ORDEM-DE-AUTORIA']
		@atributos['CPF'] = arg.attributes['CPF']
		@atributos['NRO-ID-CNPQ'] = arg.attributes['NRO-ID-CNPQ']

		@elementos = Hash.new
	end


end


class InformacoesAdicionais

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['DESCRICAO-INFORMACOES-ADICIONAIS'] = arg.attributes['DESCRICAO-INFORMACOES-ADICIONAIS']
		@atributos['DESCRICAO-INFORMACOES-ADICIONAIS-INGLES'] = arg.attributes['DESCRICAO-INFORMACOES-ADICIONAIS-INGLES']

		@elementos = Hash.new
	end


end


class ArtigosPublicados

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['ARTIGO-PUBLICADO'] = Array.new
		arg.elements.each('ARTIGO-PUBLICADO') do | i |
			@elementos['ARTIGO-PUBLICADO'].push(ArtigoPublicado.new(i))
		end
	end


end


class ArtigoPublicado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']
		@atributos['ORDEM-IMPORTANCIA'] = arg.attributes['ORDEM-IMPORTANCIA']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DO-ARTIGO'] = DadosBasicosArtigo.new(arg.elements['DADOS-BASICOS-DO-ARTIGO'])
		@elementos['DETALHAMENTO-DO-ARTIGO'] = DetalhamentoArtigo.new(arg.elements['DETALHAMENTO-DO-ARTIGO'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosArtigo

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO-DO-ARTIGO'] = arg.attributes['TITULO-DO-ARTIGO']
		@atributos['ANO-DO-ARTIGO'] = arg.attributes['ANO-DO-ARTIGO']
		@atributos['PAIS-DE-PUBLICACAO'] = arg.attributes['PAIS-DE-PUBLICACAO']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-DO-ARTIGO-INGLES'] = arg.attributes['TITULO-DO-ARTIGO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end

		def validade
			if @atributos['ANO-DO-ARTIGO'] > Date.new.year
				puts 'Ano Invalido! Artigo: '
				puts @atributos['TITULO-DO-ARTIGO']
				puts ' (' + @atributos['ANO-DO-ARTIGO'] + ')'
			end
		end

end


class DetalhamentoArtigo

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TITULO-DO-PERIODICO-OU-REVISTA'] = arg.attributes['TITULO-DO-PERIODICO-OU-REVISTA']
		@atributos['ISSN'] = arg.attributes['ISSN']
		@atributos['VOLUME'] = arg.attributes['VOLUME']
		@atributos['FASCICULO'] = arg.attributes['FASCICULO']
		@atributos['SERIE'] = arg.attributes['SERIE']
		@atributos['PAGINA-INICIAL'] = arg.attributes['PAGINA-INICIAL']
		@atributos['PAGINA-FINAL'] = arg.attributes['PAGINA-FINAL']
		@atributos['LOCAL-DE-PUBLICACAO'] = arg.attributes['LOCAL-DE-PUBLICACAO']

		@elementos = Hash.new
	end


end


class ArtigosAceitosParaPublicacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['ARTIGO-ACEITO-PARA-PUBLICACAO'] = Array.new
		arg.elements.each('ARTIGO-ACEITO-PARA-PUBLICACAO') do | i |
			@elementos['ARTIGO-ACEITO-PARA-PUBLICACAO'].push(ArtigoAceitoParaPublicacao.new(i))
		end
	end


end


class ArtigoAceitoParaPublicacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DO-ARTIGO'] = DadosBasicosArtigo.new(arg.elements['DADOS-BASICOS-DO-ARTIGO'])
		@elementos['DETALHAMENTO-DO-ARTIGO'] = DetalhamentoArtigo.new(arg.elements['DETALHAMENTO-DO-ARTIGO'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class LivrosCapitulos

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['LIVROS-PUBLICADOS-OU-ORGANIZADOS'] = LivrosPublicadosOrganizados.new(arg.elements['LIVROS-PUBLICADOS-OU-ORGANIZADOS'])
		@elementos['CAPITULOS-DE-LIVROS-PUBLICADOS'] = CapitulosLivrosPublicados.new(arg.elements['CAPITULOS-DE-LIVROS-PUBLICADOS'])
	end


end


class LivrosPublicadosOrganizados

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['LIVRO-PUBLICADO-OU-ORGANIZADO'] = Array.new
		arg.elements.each('LIVRO-PUBLICADO-OU-ORGANIZADO') do | i |
			@elementos['LIVRO-PUBLICADO-OU-ORGANIZADO'].push(LivroPublicadoOrganizado.new(i))
		end
	end


end


class CapitulosLivrosPublicados

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['CAPITULO-DE-LIVRO-PUBLICADO'] = Array.new
		arg.elements.each('CAPITULO-DE-LIVRO-PUBLICADO') do | i |
			@elementos['CAPITULO-DE-LIVRO-PUBLICADO'].push(CapituloLivroPublicado.new(i))
		end
	end


end


class LivroPublicadoOrganizado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DO-LIVRO'] = DadosBasicosLivro.new(arg.elements['DADOS-BASICOS-DO-LIVRO'])
		@elementos['DETALHAMENTO-DO-LIVRO'] = DetalhamentoLivro.new(arg.elements['DETALHAMENTO-DO-LIVRO'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosLivro

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TIPO'] = arg.attributes['TIPO']
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO-DO-LIVRO'] = arg.attributes['TITULO-DO-LIVRO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS-DE-PUBLICACAO'] = arg.attributes['PAIS-DE-PUBLICACAO']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-DO-LIVRO-INGLES'] = arg.attributes['TITULO-DO-LIVRO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoLivro

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NUMERO-DE-VOLUMES'] = arg.attributes['NUMERO-DE-VOLUMES']
		@atributos['NUMERO-DE-PAGINAS'] = arg.attributes['NUMERO-DE-PAGINAS']
		@atributos['ISBN'] = arg.attributes['ISBN']
		@atributos['NUMERO-DA-EDICAO-REVISAO'] = arg.attributes['NUMERO-DA-EDICAO-REVISAO']
		@atributos['NUMERO-DA-SERIE'] = arg.attributes['NUMERO-DA-SERIE']
		@atributos['CIDADE-DA-EDITORA'] = arg.attributes['CIDADE-DA-EDITORA']
		@atributos['NOME-DA-EDITORA'] = arg.attributes['NOME-DA-EDITORA']

		@elementos = Hash.new
	end


end


class CapituloLivroPublicado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DO-CAPITULO'] = DadosBasicosCapitulo.new(arg.elements['DADOS-BASICOS-DO-CAPITULO'])
		@elementos['DETALHAMENTO-DO-CAPITULO'] = DetalhamentoCapitulo.new(arg.elements['DETALHAMENTO-DO-CAPITULO'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosCapitulo

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TIPO'] = arg.attributes['TIPO']
		@atributos['TITULO-DO-CAPITULO-DO-LIVRO'] = arg.attributes['TITULO-DO-CAPITULO-DO-LIVRO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS-DE-PUBLICACAO'] = arg.attributes['PAIS-DE-PUBLICACAO']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-DO-CAPITULO-DO-LIVRO-INGLES'] = arg.attributes['TITULO-DO-CAPITULO-DO-LIVRO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoCapitulo

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TITULO-DO-LIVRO'] = arg.attributes['TITULO-DO-LIVRO']
		@atributos['NUMERO-DE-VOLUMES'] = arg.attributes['NUMERO-DE-VOLUMES']
		@atributos['PAGINA-INICIAL'] = arg.attributes['PAGINA-INICIAL']
		@atributos['PAGINA-FINAL'] = arg.attributes['PAGINA-FINAL']
		@atributos['ISBN'] = arg.attributes['ISBN']
		@atributos['ORGANIZADORES'] = arg.attributes['ORGANIZADORES']
		@atributos['NUMERO-DA-EDICAO-REVISAO'] = arg.attributes['NUMERO-DA-EDICAO-REVISAO']
		@atributos['NUMERO-DA-SERIE'] = arg.attributes['NUMERO-DA-SERIE']
		@atributos['CIDADE-DA-EDITORA'] = arg.attributes['CIDADE-DA-EDITORA']
		@atributos['NOME-DA-EDITORA'] = arg.attributes['NOME-DA-EDITORA']

		@elementos = Hash.new
	end


end


class TextosJornaisRevistas

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['TEXTO-EM-JORNAL-OU-REVISTA'] = Array.new
		arg.elements.each('TEXTO-EM-JORNAL-OU-REVISTA') do | i |
			@elementos['TEXTO-EM-JORNAL-OU-REVISTA'].push(TextoJornalRevista.new(i))
		end
	end


end


class TextoJornalRevista

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DO-TEXTO'] = DadosBasicosTexto.new(arg.elements['DADOS-BASICOS-DO-TEXTO'])
		@elementos['DETALHAMENTO-DO-TEXTO'] = DetalhamentoTexto.new(arg.elements['DETALHAMENTO-DO-TEXTO'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosTexto

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO-DO-TEXTO'] = arg.attributes['TITULO-DO-TEXTO']
		@atributos['ANO-DO-TEXTO'] = arg.attributes['ANO-DO-TEXTO']
		@atributos['PAIS-DE-PUBLICACAO'] = arg.attributes['PAIS-DE-PUBLICACAO']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-DO-TEXTO-INGLES'] = arg.attributes['TITULO-DO-TEXTO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoTexto

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TITULO-DO-JORNAL-OU-REVISTA'] = arg.attributes['TITULO-DO-JORNAL-OU-REVISTA']
		@atributos['ISSN'] = arg.attributes['ISSN']
		@atributos['FORMATO-DATA-DE-PUBLICACAO'] = arg.attributes['FORMATO-DATA-DE-PUBLICACAO']
		@atributos['DATA-DE-PUBLICACAO'] = arg.attributes['DATA-DE-PUBLICACAO']
		@atributos['VOLUME'] = arg.attributes['VOLUME']
		@atributos['PAGINA-INICIAL'] = arg.attributes['PAGINA-INICIAL']
		@atributos['PAGINA-FINAL'] = arg.attributes['PAGINA-FINAL']
		@atributos['LOCAL-DE-PUBLICACAO'] = arg.attributes['LOCAL-DE-PUBLICACAO']

		@elementos = Hash.new
	end


end


class DemaisTiposProducaoBibliografica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['OUTRA-PRODUCAO-BIBLIOGRAFICA'] = Array.new
		arg.elements.each('OUTRA-PRODUCAO-BIBLIOGRAFICA') do | i |
			@elementos['OUTRA-PRODUCAO-BIBLIOGRAFICA'].push(OutraProducaoBibliografica.new(i))
		end
		@elementos['PARTITURA-MUSICAL'] = Array.new
		arg.elements.each('PARTITURA-MUSICAL') do | i |
			@elementos['PARTITURA-MUSICAL'].push(PartituraMusical.new(i))
		end
		@elementos['PREFACIO-POSFACIO'] = Array.new
		arg.elements.each('PREFACIO-POSFACIO') do | i |
			@elementos['PREFACIO-POSFACIO'].push(PrefacioPosfacio.new(i))
		end
		@elementos['TRADUCAO'] = Array.new
		arg.elements.each('TRADUCAO') do | i |
			@elementos['TRADUCAO'].push(Traducao.new(i))
		end
	end


end


class OutraProducaoBibliografica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-OUTRA-PRODUCAO'] = DadosBasicosOutraProducao.new(arg.elements['DADOS-BASICOS-DE-OUTRA-PRODUCAO'])
		@elementos['DETALHAMENTO-DE-OUTRA-PRODUCAO'] = DetalhamentoOutraProducao.new(arg.elements['DETALHAMENTO-DE-OUTRA-PRODUCAO'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosOutraProducao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS-DE-PUBLICACAO'] = arg.attributes['PAIS-DE-PUBLICACAO']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['NATUREZA-INGLES'] = arg.attributes['NATUREZA-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoOutraProducao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['EDITORA'] = arg.attributes['EDITORA']
		@atributos['CIDADE-DA-EDITORA'] = arg.attributes['CIDADE-DA-EDITORA']
		@atributos['NUMERO-DE-PAGINAS'] = arg.attributes['NUMERO-DE-PAGINAS']
		@atributos['ISSN-ISBN'] = arg.attributes['ISSN-ISBN']

		@elementos = Hash.new
	end


end


class PartituraMusical

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-PARTITURA'] = DadosBasicosPartitura.new(arg.elements['DADOS-BASICOS-DA-PARTITURA'])
		@elementos['DETALHAMENTO-DA-PARTITURA'] = DetalhamentoPartitura.new(arg.elements['DETALHAMENTO-DA-PARTITURA'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosPartitura

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS-DE-PUBLICACAO'] = arg.attributes['PAIS-DE-PUBLICACAO']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoPartitura

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['FORMACAO-INSTRUMENTAL'] = arg.attributes['FORMACAO-INSTRUMENTAL']
		@atributos['EDITORA'] = arg.attributes['EDITORA']
		@atributos['CIDADE-DA-EDITORA'] = arg.attributes['CIDADE-DA-EDITORA']
		@atributos['NUMERO-DE-PAGINAS'] = arg.attributes['NUMERO-DE-PAGINAS']
		@atributos['NUMERO-DO-CATALOGO'] = arg.attributes['NUMERO-DO-CATALOGO']

		@elementos = Hash.new
	end


end


class PrefacioPosfacio

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DO-PREFACIO-POSFACIO'] = DadosBasicosPrefacioPosfacio.new(arg.elements['DADOS-BASICOS-DO-PREFACIO-POSFACIO'])
		@elementos['DETALHAMENTO-DO-PREFACIO-POSFACIO'] = DetalhamentoPrefacioPosfacio.new(arg.elements['DETALHAMENTO-DO-PREFACIO-POSFACIO'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosPrefacioPosfacio

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TIPO'] = arg.attributes['TIPO']
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS-DE-PUBLICACAO'] = arg.attributes['PAIS-DE-PUBLICACAO']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoPrefacioPosfacio

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-AUTOR-DA-PUBLICACAO'] = arg.attributes['NOME-DO-AUTOR-DA-PUBLICACAO']
		@atributos['TITULO-DA-PUBLICACAO'] = arg.attributes['TITULO-DA-PUBLICACAO']
		@atributos['ISSN-ISBN'] = arg.attributes['ISSN-ISBN']
		@atributos['NUMERO-DA-EDICAO-REVISAO'] = arg.attributes['NUMERO-DA-EDICAO-REVISAO']
		@atributos['VOLUME'] = arg.attributes['VOLUME']
		@atributos['SERIE'] = arg.attributes['SERIE']
		@atributos['FASCICULO'] = arg.attributes['FASCICULO']
		@atributos['EDITORA-DO-PREFACIO-POSFACIO'] = arg.attributes['EDITORA-DO-PREFACIO-POSFACIO']
		@atributos['CIDADE-DA-EDITORA'] = arg.attributes['CIDADE-DA-EDITORA']

		@elementos = Hash.new
	end


end


class Traducao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-TRADUCAO'] = DadosBasicosTraducao.new(arg.elements['DADOS-BASICOS-DA-TRADUCAO'])
		@elementos['DETALHAMENTO-DA-TRADUCAO'] = DetalhamentoTraducao.new(arg.elements['DETALHAMENTO-DA-TRADUCAO'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosTraducao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS-DE-PUBLICACAO'] = arg.attributes['PAIS-DE-PUBLICACAO']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoTraducao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-AUTOR-TRADUZIDO'] = arg.attributes['NOME-DO-AUTOR-TRADUZIDO']
		@atributos['TITULO-DA-OBRA-ORIGINAL'] = arg.attributes['TITULO-DA-OBRA-ORIGINAL']
		@atributos['ISSN-ISBN'] = arg.attributes['ISSN-ISBN']
		@atributos['IDIOMA-DA-OBRA-ORIGINAL'] = arg.attributes['IDIOMA-DA-OBRA-ORIGINAL']
		@atributos['EDITORA-DA-TRADUCAO'] = arg.attributes['EDITORA-DA-TRADUCAO']
		@atributos['CIDADE-DA-EDITORA'] = arg.attributes['CIDADE-DA-EDITORA']
		@atributos['NUMERO-DE-PAGINAS'] = arg.attributes['NUMERO-DE-PAGINAS']
		@atributos['NUMERO-DA-EDICAO-REVISAO'] = arg.attributes['NUMERO-DA-EDICAO-REVISAO']
		@atributos['VOLUME'] = arg.attributes['VOLUME']
		@atributos['FASCICULO'] = arg.attributes['FASCICULO']
		@atributos['SERIE'] = arg.attributes['SERIE']

		@elementos = Hash.new
	end


end


class ProducaoTecnica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['CULTIVAR-REGISTRADA'] = Array.new
		arg.elements.each('CULTIVAR-REGISTRADA') do | i |
			@elementos['CULTIVAR-REGISTRADA'].push(CultivarRegistrada.new(i))
		end
		@elementos['SOFTWARE'] = Array.new
		arg.elements.each('SOFTWARE') do | i |
			@elementos['SOFTWARE'].push(Software.new(i))
		end
		@elementos['PATENTE'] = Array.new
		arg.elements.each('PATENTE') do | i |
			@elementos['PATENTE'].push(Patente.new(i))
		end
		@elementos['CULTIVAR-PROTEGIDA'] = Array.new
		arg.elements.each('CULTIVAR-PROTEGIDA') do | i |
			@elementos['CULTIVAR-PROTEGIDA'].push(CultivarProtegida.new(i))
		end
		@elementos['DESENHO-INDUSTRIAL'] = Array.new
		arg.elements.each('DESENHO-INDUSTRIAL') do | i |
			@elementos['DESENHO-INDUSTRIAL'].push(DesenhoIndustrial.new(i))
		end
		@elementos['MARCA'] = Array.new
		arg.elements.each('MARCA') do | i |
			@elementos['MARCA'].push(Marca.new(i))
		end
		@elementos['TOPOGRAFIA-DE-CIRCUITO-INTEGRADO'] = Array.new
		arg.elements.each('TOPOGRAFIA-DE-CIRCUITO-INTEGRADO') do | i |
			@elementos['TOPOGRAFIA-DE-CIRCUITO-INTEGRADO'].push(TopografiaCircuitoIntegrado.new(i))
		end
		@elementos['PRODUTO-TECNOLOGICO'] = Array.new
		arg.elements.each('PRODUTO-TECNOLOGICO') do | i |
			@elementos['PRODUTO-TECNOLOGICO'].push(ProdutoTecnologico.new(i))
		end
		@elementos['PROCESSOS-OU-TECNICAS'] = Array.new
		arg.elements.each('PROCESSOS-OU-TECNICAS') do | i |
			@elementos['PROCESSOS-OU-TECNICAS'].push(ProcessosTecnicas.new(i))
		end
		@elementos['TRABALHO-TECNICO'] = Array.new
		arg.elements.each('TRABALHO-TECNICO') do | i |
			@elementos['TRABALHO-TECNICO'].push(TrabalhoTecnico.new(i))
		end
		@elementos['DEMAIS-TIPOS-DE-PRODUCAO-TECNICA'] = Array.new
		arg.elements.each('DEMAIS-TIPOS-DE-PRODUCAO-TECNICA') do | i |
			@elementos['DEMAIS-TIPOS-DE-PRODUCAO-TECNICA'].push(DemaisTiposProducaoTecnica.new(i))
		end
	end


end


class RegistroPatente

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TIPO-PATENTE'] = arg.attributes['TIPO-PATENTE']
		@atributos['CODIGO-DO-REGISTRO-OU-PATENTE'] = arg.attributes['CODIGO-DO-REGISTRO-OU-PATENTE']
		@atributos['TITULO-PATENTE'] = arg.attributes['TITULO-PATENTE']
		@atributos['FORMATO-DATA-PEDIDO'] = arg.attributes['FORMATO-DATA-PEDIDO']
		@atributos['DATA-PEDIDO-DE-DEPOSITO'] = arg.attributes['DATA-PEDIDO-DE-DEPOSITO']
		@atributos['DATA-DE-PEDIDO-DE-EXAME'] = arg.attributes['DATA-DE-PEDIDO-DE-EXAME']
		@atributos['DATA-DE-CONCESSAO'] = arg.attributes['DATA-DE-CONCESSAO']
		@atributos['INSTITUICAO-DEPOSITO-REGISTRO'] = arg.attributes['INSTITUICAO-DEPOSITO-REGISTRO']
		@atributos['NUMERO-DEPOSITO-PCT'] = arg.attributes['NUMERO-DEPOSITO-PCT']
		@atributos['FORMATO-DATA-DEPOSITO-PCT'] = arg.attributes['FORMATO-DATA-DEPOSITO-PCT']
		@atributos['DATA-DEPOSITO-PCT'] = arg.attributes['DATA-DEPOSITO-PCT']
		@atributos['NOME-DO-TITULAR'] = arg.attributes['NOME-DO-TITULAR']

		@elementos = Hash.new
	end


end


class Software

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DO-SOFTWARE'] = DadosBasicosSoftware.new(arg.elements['DADOS-BASICOS-DO-SOFTWARE'])
		@elementos['DETALHAMENTO-DO-SOFTWARE'] = DetalhamentoSoftware.new(arg.elements['DETALHAMENTO-DO-SOFTWARE'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosSoftware

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO-DO-SOFTWARE'] = arg.attributes['TITULO-DO-SOFTWARE']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-DO-SOFTWARE-INGLES'] = arg.attributes['TITULO-DO-SOFTWARE-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']
		@atributos['FLAG-POTENCIAL-INOVACAO'] = arg.attributes['FLAG-POTENCIAL-INOVACAO']

		@elementos = Hash.new
	end


end


class DetalhamentoSoftware

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['FINALIDADE'] = arg.attributes['FINALIDADE']
		@atributos['PLATAFORMA'] = arg.attributes['PLATAFORMA']
		@atributos['AMBIENTE'] = arg.attributes['AMBIENTE']
		@atributos['DISPONIBILIDADE'] = arg.attributes['DISPONIBILIDADE']
		@atributos['INSTITUICAO-FINANCIADORA'] = arg.attributes['INSTITUICAO-FINANCIADORA']
		@atributos['FINALIDADE-INGLES'] = arg.attributes['FINALIDADE-INGLES']

		@elementos = Hash.new
		@elementos['REGISTRO-OU-PATENTE'] = Array.new
		arg.elements.each('REGISTRO-OU-PATENTE') do | i |
			@elementos['REGISTRO-OU-PATENTE'].push(RegistroPatente.new(i))
		end
	end


end


class ProdutoTecnologico

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DO-PRODUTO-TECNOLOGICO'] = DadosBasicosProdutoTecnologico.new(arg.elements['DADOS-BASICOS-DO-PRODUTO-TECNOLOGICO'])
		@elementos['DETALHAMENTO-DO-PRODUTO-TECNOLOGICO'] = DetalhamentoProdutoTecnologico.new(arg.elements['DETALHAMENTO-DO-PRODUTO-TECNOLOGICO'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosProdutoTecnologico

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TIPO-PRODUTO'] = arg.attributes['TIPO-PRODUTO']
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO-DO-PRODUTO'] = arg.attributes['TITULO-DO-PRODUTO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-DO-PRODUTO-INGLES'] = arg.attributes['TITULO-DO-PRODUTO-INGLES']
		@atributos['FLAG-POTENCIAL-INOVACAO'] = arg.attributes['FLAG-POTENCIAL-INOVACAO']

		@elementos = Hash.new
	end


end


class DetalhamentoProdutoTecnologico

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['FINALIDADE'] = arg.attributes['FINALIDADE']
		@atributos['DISPONIBILIDADE'] = arg.attributes['DISPONIBILIDADE']
		@atributos['CIDADE-DO-PRODUTO'] = arg.attributes['CIDADE-DO-PRODUTO']
		@atributos['INSTITUICAO-FINANCIADORA'] = arg.attributes['INSTITUICAO-FINANCIADORA']
		@atributos['FINALIDADE-INGLES'] = arg.attributes['FINALIDADE-INGLES']

		@elementos = Hash.new
		@elementos['REGISTRO-OU-PATENTE'] = Array.new
		arg.elements.each('REGISTRO-OU-PATENTE') do | i |
			@elementos['REGISTRO-OU-PATENTE'].push(RegistroPatente.new(i))
		end
	end


end


class Titulares

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME'] = arg.attributes['NOME']
		@atributos['NOME-PARA-CITACAO'] = arg.attributes['NOME-PARA-CITACAO']
		@atributos['ORDEM'] = arg.attributes['ORDEM']
		@atributos['NRO-ID-CNPQ'] = arg.attributes['NRO-ID-CNPQ']
		@atributos['COD_INST'] = arg.attributes['COD_INST']
		@atributos['TIPO'] = arg.attributes['TIPO']

		@elementos = Hash.new
	end


end


class Patente

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-PATENTE'] = DadosBasicosPatente.new(arg.elements['DADOS-BASICOS-DA-PATENTE'])
		@elementos['DETALHAMENTO-DA-PATENTE'] = DetalhamentoPatente.new(arg.elements['DETALHAMENTO-DA-PATENTE'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosPatente

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO-DESENVOLVIMENTO'] = arg.attributes['ANO-DESENVOLVIMENTO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['FLAG-POTENCIAL-INOVACAO'] = arg.attributes['FLAG-POTENCIAL-INOVACAO']

		@elementos = Hash.new
	end


end


class DetalhamentoPatente

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['FINALIDADE'] = arg.attributes['FINALIDADE']
		@atributos['INSTITUICAO-FINANCIADORA'] = arg.attributes['INSTITUICAO-FINANCIADORA']
		@atributos['FINALIDADE-INGLES'] = arg.attributes['FINALIDADE-INGLES']
		@atributos['CATEGORIA'] = arg.attributes['CATEGORIA']

		@elementos = Hash.new
		@elementos['REGISTRO-OU-PATENTE'] = Array.new
		arg.elements.each('REGISTRO-OU-PATENTE') do | i |
			@elementos['REGISTRO-OU-PATENTE'].push(RegistroPatente.new(i))
		end
	end


end


class CultivarProtegida

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-CULTIVAR'] = DadosBasicosCultivar.new(arg.elements['DADOS-BASICOS-DA-CULTIVAR'])
		@elementos['DETALHAMENTO-DA-CULTIVAR'] = DetalhamentoCultivar.new(arg.elements['DETALHAMENTO-DA-CULTIVAR'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class CultivarRegistrada

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-CULTIVAR'] = DadosBasicosCultivar.new(arg.elements['DADOS-BASICOS-DA-CULTIVAR'])
		@elementos['DETALHAMENTO-DA-CULTIVAR'] = DetalhamentoCultivar.new(arg.elements['DETALHAMENTO-DA-CULTIVAR'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosCultivar

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['DENOMINACAO'] = arg.attributes['DENOMINACAO']
		@atributos['ANO-SOLICITACAO'] = arg.attributes['ANO-SOLICITACAO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DENOMINACAO-INGLES'] = arg.attributes['DENOMINACAO-INGLES']
		@atributos['FLAG-POTENCIAL-INOVACAO'] = arg.attributes['FLAG-POTENCIAL-INOVACAO']

		@elementos = Hash.new
	end


end


class DetalhamentoCultivar

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['FINALIDADE'] = arg.attributes['FINALIDADE']
		@atributos['INSTITUICAO-FINANCIADORA'] = arg.attributes['INSTITUICAO-FINANCIADORA']
		@atributos['FINALIDADE-INGLES'] = arg.attributes['FINALIDADE-INGLES']

		@elementos = Hash.new
		@elementos['REGISTRO-OU-PATENTE'] = Array.new
		arg.elements.each('REGISTRO-OU-PATENTE') do | i |
			@elementos['REGISTRO-OU-PATENTE'].push(RegistroPatente.new(i))
		end
	end


end


class DesenhoIndustrial

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DO-DESENHO-INDUSTRIAL'] = DadosBasicosDesenhoIndustrial.new(arg.elements['DADOS-BASICOS-DO-DESENHO-INDUSTRIAL'])
		@elementos['DETALHAMENTO-DO-DESENHO-INDUSTRIAL'] = DetalhamentoDesenhoIndustrial.new(arg.elements['DETALHAMENTO-DO-DESENHO-INDUSTRIAL'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosDesenhoIndustrial

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO-DESENVOLVIMENTO'] = arg.attributes['ANO-DESENVOLVIMENTO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['FLAG-POTENCIAL-INOVACAO'] = arg.attributes['FLAG-POTENCIAL-INOVACAO']

		@elementos = Hash.new
	end


end


class DetalhamentoDesenhoIndustrial

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['FINALIDADE'] = arg.attributes['FINALIDADE']
		@atributos['INSTITUICAO-FINANCIADORA'] = arg.attributes['INSTITUICAO-FINANCIADORA']
		@atributos['FINALIDADE-INGLES'] = arg.attributes['FINALIDADE-INGLES']

		@elementos = Hash.new
		@elementos['REGISTRO-OU-PATENTE'] = Array.new
		arg.elements.each('REGISTRO-OU-PATENTE') do | i |
			@elementos['REGISTRO-OU-PATENTE'].push(RegistroPatente.new(i))
		end
	end


end


class Marca

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-MARCA'] = DadosBasicosMarca.new(arg.elements['DADOS-BASICOS-DA-MARCA'])
		@elementos['DETALHAMENTO-DA-MARCA'] = DetalhamentoMarca.new(arg.elements['DETALHAMENTO-DA-MARCA'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosMarca

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO-DESENVOLVIMENTO'] = arg.attributes['ANO-DESENVOLVIMENTO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['FLAG-POTENCIAL-INOVACAO'] = arg.attributes['FLAG-POTENCIAL-INOVACAO']

		@elementos = Hash.new
	end


end


class DetalhamentoMarca

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['FINALIDADE'] = arg.attributes['FINALIDADE']
		@atributos['FINALIDADE-INGLES'] = arg.attributes['FINALIDADE-INGLES']
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']

		@elementos = Hash.new
		@elementos['REGISTRO-OU-PATENTE'] = Array.new
		arg.elements.each('REGISTRO-OU-PATENTE') do | i |
			@elementos['REGISTRO-OU-PATENTE'].push(RegistroPatente.new(i))
		end
	end


end


class TopografiaCircuitoIntegrado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-TOPOGRAFIA-DE-CIRCUITO-INTEGRADO'] = DadosBasicosTopografiaCircuitoIntegrado.new(arg.elements['DADOS-BASICOS-DA-TOPOGRAFIA-DE-CIRCUITO-INTEGRADO'])
		@elementos['DETALHAMENTO-DA-TOPOGRAFIA-DE-CIRCUITO-INTEGRADO'] = DetalhamentoTopografiaCircuitoIntegrado.new(arg.elements['DETALHAMENTO-DA-TOPOGRAFIA-DE-CIRCUITO-INTEGRADO'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosTopografiaCircuitoIntegrado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO-DESENVOLVIMENTO'] = arg.attributes['ANO-DESENVOLVIMENTO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['FLAG-POTENCIAL-INOVACAO'] = arg.attributes['FLAG-POTENCIAL-INOVACAO']

		@elementos = Hash.new
	end


end


class DetalhamentoTopografiaCircuitoIntegrado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['FINALIDADE'] = arg.attributes['FINALIDADE']
		@atributos['INSTITUICAO-FINANCIADORA'] = arg.attributes['INSTITUICAO-FINANCIADORA']
		@atributos['FINALIDADE-INGLES'] = arg.attributes['FINALIDADE-INGLES']

		@elementos = Hash.new
		@elementos['REGISTRO-OU-PATENTE'] = Array.new
		arg.elements.each('REGISTRO-OU-PATENTE') do | i |
			@elementos['REGISTRO-OU-PATENTE'].push(RegistroPatente.new(i))
		end
	end


end


class ProcessosTecnicas

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DO-PROCESSOS-OU-TECNICAS'] = DadosBasicosProcessosTecnicas.new(arg.elements['DADOS-BASICOS-DO-PROCESSOS-OU-TECNICAS'])
		@elementos['DETALHAMENTO-DO-PROCESSOS-OU-TECNICAS'] = DetalhamentoProcessosTecnicas.new(arg.elements['DETALHAMENTO-DO-PROCESSOS-OU-TECNICAS'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosProcessosTecnicas

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO-DO-PROCESSO'] = arg.attributes['TITULO-DO-PROCESSO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-DO-PROCESSO-INGLES'] = arg.attributes['TITULO-DO-PROCESSO-INGLES']
		@atributos['FLAG-POTENCIAL-INOVACAO'] = arg.attributes['FLAG-POTENCIAL-INOVACAO']

		@elementos = Hash.new
	end


end


class DetalhamentoProcessosTecnicas

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['FINALIDADE'] = arg.attributes['FINALIDADE']
		@atributos['DISPONIBILIDADE'] = arg.attributes['DISPONIBILIDADE']
		@atributos['INSTITUICAO-FINANCIADORA'] = arg.attributes['INSTITUICAO-FINANCIADORA']
		@atributos['CIDADE-DO-PROCESSO'] = arg.attributes['CIDADE-DO-PROCESSO']
		@atributos['FINALIDADE-INGLES'] = arg.attributes['FINALIDADE-INGLES']

		@elementos = Hash.new
		@elementos['REGISTRO-OU-PATENTE'] = Array.new
		arg.elements.each('REGISTRO-OU-PATENTE') do | i |
			@elementos['REGISTRO-OU-PATENTE'].push(RegistroPatente.new(i))
		end
	end


end


class TrabalhoTecnico

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DO-TRABALHO-TECNICO'] = DadosBasicosTrabalhoTecnico.new(arg.elements['DADOS-BASICOS-DO-TRABALHO-TECNICO'])
		@elementos['DETALHAMENTO-DO-TRABALHO-TECNICO'] = DetalhamentoTrabalhoTecnico.new(arg.elements['DETALHAMENTO-DO-TRABALHO-TECNICO'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosTrabalhoTecnico

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO-DO-TRABALHO-TECNICO'] = arg.attributes['TITULO-DO-TRABALHO-TECNICO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-DO-TRABALHO-TECNICO-INGLES'] = arg.attributes['TITULO-DO-TRABALHO-TECNICO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoTrabalhoTecnico

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['FINALIDADE'] = arg.attributes['FINALIDADE']
		@atributos['DURACAO-EM-MESES'] = arg.attributes['DURACAO-EM-MESES']
		@atributos['NUMERO-DE-PAGINAS'] = arg.attributes['NUMERO-DE-PAGINAS']
		@atributos['DISPONIBILIDADE'] = arg.attributes['DISPONIBILIDADE']
		@atributos['INSTITUICAO-FINANCIADORA'] = arg.attributes['INSTITUICAO-FINANCIADORA']
		@atributos['CIDADE-DO-TRABALHO'] = arg.attributes['CIDADE-DO-TRABALHO']
		@atributos['FINALIDADE-INGLES'] = arg.attributes['FINALIDADE-INGLES']

		@elementos = Hash.new
	end


end


class DemaisTiposProducaoTecnica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['APRESENTACAO-DE-TRABALHO'] = Array.new
		arg.elements.each('APRESENTACAO-DE-TRABALHO') do | i |
			@elementos['APRESENTACAO-DE-TRABALHO'].push(ApresentacaoTrabalho.new(i))
		end
		@elementos['CARTA-MAPA-OU-SIMILAR'] = Array.new
		arg.elements.each('CARTA-MAPA-OU-SIMILAR') do | i |
			@elementos['CARTA-MAPA-OU-SIMILAR'].push(CartaMapaSimilar.new(i))
		end
		@elementos['CURSO-DE-CURTA-DURACAO-MINISTRADO'] = Array.new
		arg.elements.each('CURSO-DE-CURTA-DURACAO-MINISTRADO') do | i |
			@elementos['CURSO-DE-CURTA-DURACAO-MINISTRADO'].push(CursoCurtaDuracaoMinistrado.new(i))
		end
		@elementos['DESENVOLVIMENTO-DE-MATERIAL-DIDATICO-OU-INSTRUCIONAL'] = Array.new
		arg.elements.each('DESENVOLVIMENTO-DE-MATERIAL-DIDATICO-OU-INSTRUCIONAL') do | i |
			@elementos['DESENVOLVIMENTO-DE-MATERIAL-DIDATICO-OU-INSTRUCIONAL'].push(DesenvolvimentoMaterialDidaticoInstrucional.new(i))
		end
		@elementos['EDITORACAO'] = Array.new
		arg.elements.each('EDITORACAO') do | i |
			@elementos['EDITORACAO'].push(Editoracao.new(i))
		end
		@elementos['MANUTENCAO-DE-OBRA-ARTISTICA'] = Array.new
		arg.elements.each('MANUTENCAO-DE-OBRA-ARTISTICA') do | i |
			@elementos['MANUTENCAO-DE-OBRA-ARTISTICA'].push(ManutencaoObraArtistica.new(i))
		end
		@elementos['MAQUETE'] = Array.new
		arg.elements.each('MAQUETE') do | i |
			@elementos['MAQUETE'].push(Maquete.new(i))
		end
		@elementos['ORGANIZACAO-DE-EVENTO'] = Array.new
		arg.elements.each('ORGANIZACAO-DE-EVENTO') do | i |
			@elementos['ORGANIZACAO-DE-EVENTO'].push(OrganizacaoEvento.new(i))
		end
		@elementos['PROGRAMA-DE-RADIO-OU-TV'] = Array.new
		arg.elements.each('PROGRAMA-DE-RADIO-OU-TV') do | i |
			@elementos['PROGRAMA-DE-RADIO-OU-TV'].push(ProgramaRadioTv.new(i))
		end
		@elementos['RELATORIO-DE-PESQUISA'] = Array.new
		arg.elements.each('RELATORIO-DE-PESQUISA') do | i |
			@elementos['RELATORIO-DE-PESQUISA'].push(RelatorioPesquisa.new(i))
		end
		@elementos['MIDIA-SOCIAL-WEBSITE-BLOG'] = Array.new
		arg.elements.each('MIDIA-SOCIAL-WEBSITE-BLOG') do | i |
			@elementos['MIDIA-SOCIAL-WEBSITE-BLOG'].push(MidiaSocialWebsiteBlog.new(i))
		end
		@elementos['OUTRA-PRODUCAO-TECNICA'] = Array.new
		arg.elements.each('OUTRA-PRODUCAO-TECNICA') do | i |
			@elementos['OUTRA-PRODUCAO-TECNICA'].push(OutraProducaoTecnica.new(i))
		end
	end


end


class ApresentacaoTrabalho

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-APRESENTACAO-DE-TRABALHO'] = DadosBasicosApresentacaoTrabalho.new(arg.elements['DADOS-BASICOS-DA-APRESENTACAO-DE-TRABALHO'])
		@elementos['DETALHAMENTO-DA-APRESENTACAO-DE-TRABALHO'] = DetalhamentoApresentacaoTrabalho.new(arg.elements['DETALHAMENTO-DA-APRESENTACAO-DE-TRABALHO'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosApresentacaoTrabalho

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoApresentacaoTrabalho

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-EVENTO'] = arg.attributes['NOME-DO-EVENTO']
		@atributos['INSTITUICAO-PROMOTORA'] = arg.attributes['INSTITUICAO-PROMOTORA']
		@atributos['LOCAL-DA-APRESENTACAO'] = arg.attributes['LOCAL-DA-APRESENTACAO']
		@atributos['CIDADE-DA-APRESENTACAO'] = arg.attributes['CIDADE-DA-APRESENTACAO']
		@atributos['NOME-DO-EVENTO-INGLES'] = arg.attributes['NOME-DO-EVENTO-INGLES']

		@elementos = Hash.new
	end


end


class CartaMapaSimilar

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-CARTA-MAPA-OU-SIMILAR'] = DadosBasicosCartaMapaSimilar.new(arg.elements['DADOS-BASICOS-DE-CARTA-MAPA-OU-SIMILAR'])
		@elementos['DETALHAMENTO-DE-CARTA-MAPA-OU-SIMILAR'] = DetalhamentoCartaMapaSimilar.new(arg.elements['DETALHAMENTO-DE-CARTA-MAPA-OU-SIMILAR'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosCartaMapaSimilar

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoCartaMapaSimilar

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TEMA-DA-CARTA-MAPA-OU-SIMILAR'] = arg.attributes['TEMA-DA-CARTA-MAPA-OU-SIMILAR']
		@atributos['TECNICA-UTILIZADA'] = arg.attributes['TECNICA-UTILIZADA']
		@atributos['FINALIDADE'] = arg.attributes['FINALIDADE']
		@atributos['AREA-REPRESENTADA'] = arg.attributes['AREA-REPRESENTADA']
		@atributos['INSTITUICAO-FINANCIADORA'] = arg.attributes['INSTITUICAO-FINANCIADORA']
		@atributos['FINALIDADE-INGLES'] = arg.attributes['FINALIDADE-INGLES']

		@elementos = Hash.new
	end


end


class CursoCurtaDuracaoMinistrado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-CURSOS-CURTA-DURACAO-MINISTRADO'] = DadosBasicosCursosCurtaDuracaoMinistrado.new(arg.elements['DADOS-BASICOS-DE-CURSOS-CURTA-DURACAO-MINISTRADO'])
		@elementos['DETALHAMENTO-DE-CURSOS-CURTA-DURACAO-MINISTRADO'] = DetalhamentoCursosCurtaDuracaoMinistrado.new(arg.elements['DETALHAMENTO-DE-CURSOS-CURTA-DURACAO-MINISTRADO'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosCursosCurtaDuracaoMinistrado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NIVEL-DO-CURSO'] = arg.attributes['NIVEL-DO-CURSO']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoCursosCurtaDuracaoMinistrado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['PARTICIPACAO-DOS-AUTORES'] = arg.attributes['PARTICIPACAO-DOS-AUTORES']
		@atributos['INSTITUICAO-PROMOTORA-DO-CURSO'] = arg.attributes['INSTITUICAO-PROMOTORA-DO-CURSO']
		@atributos['LOCAL-DO-CURSO'] = arg.attributes['LOCAL-DO-CURSO']
		@atributos['CIDADE'] = arg.attributes['CIDADE']
		@atributos['DURACAO'] = arg.attributes['DURACAO']
		@atributos['UNIDADE'] = arg.attributes['UNIDADE']
		@atributos['UNIDADE-INGLES'] = arg.attributes['UNIDADE-INGLES']

		@elementos = Hash.new
	end


end


class DesenvolvimentoMaterialDidaticoInstrucional

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DO-MATERIAL-DIDATICO-OU-INSTRUCIONAL'] = DadosBasicosMaterialDidaticoInstrucional.new(arg.elements['DADOS-BASICOS-DO-MATERIAL-DIDATICO-OU-INSTRUCIONAL'])
		@elementos['DETALHAMENTO-DO-MATERIAL-DIDATICO-OU-INSTRUCIONAL'] = DetalhamentoMaterialDidaticoInstrucional.new(arg.elements['DETALHAMENTO-DO-MATERIAL-DIDATICO-OU-INSTRUCIONAL'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosMaterialDidaticoInstrucional

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['NATUREZA-INGLES'] = arg.attributes['NATUREZA-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoMaterialDidaticoInstrucional

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['FINALIDADE'] = arg.attributes['FINALIDADE']
		@atributos['FINALIDADE-INGLES'] = arg.attributes['FINALIDADE-INGLES']

		@elementos = Hash.new
	end


end


class Editoracao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-EDITORACAO'] = DadosBasicosEditoracao.new(arg.elements['DADOS-BASICOS-DE-EDITORACAO'])
		@elementos['DETALHAMENTO-DE-EDITORACAO'] = DetalhamentoEditoracao.new(arg.elements['DETALHAMENTO-DE-EDITORACAO'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosEditoracao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoEditoracao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NUMERO-DE-PAGINAS'] = arg.attributes['NUMERO-DE-PAGINAS']
		@atributos['INSTITUICAO-PROMOTORA'] = arg.attributes['INSTITUICAO-PROMOTORA']
		@atributos['EDITORA'] = arg.attributes['EDITORA']
		@atributos['CIDADE'] = arg.attributes['CIDADE']

		@elementos = Hash.new
	end


end


class ManutencaoObraArtistica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-MANUTENCAO-DE-OBRA-ARTISTICA'] = DadosBasicosManutencaoObraArtistica.new(arg.elements['DADOS-BASICOS-DE-MANUTENCAO-DE-OBRA-ARTISTICA'])
		@elementos['DETALHAMENTO-DE-MANUTENCAO-DE-OBRA-ARTISTICA'] = DetalhamentoManutencaoObraArtistica.new(arg.elements['DETALHAMENTO-DE-MANUTENCAO-DE-OBRA-ARTISTICA'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosManutencaoObraArtistica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TIPO'] = arg.attributes['TIPO']
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoManutencaoObraArtistica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DA-OBRA'] = arg.attributes['NOME-DA-OBRA']
		@atributos['AUTOR-DA-OBRA'] = arg.attributes['AUTOR-DA-OBRA']
		@atributos['ANO-DA-OBRA'] = arg.attributes['ANO-DA-OBRA']
		@atributos['ACERVO'] = arg.attributes['ACERVO']
		@atributos['LOCAL'] = arg.attributes['LOCAL']
		@atributos['CIDADE'] = arg.attributes['CIDADE']

		@elementos = Hash.new
	end


end


class Maquete

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-MAQUETE'] = DadosBasicosMaquete.new(arg.elements['DADOS-BASICOS-DA-MAQUETE'])
		@elementos['DETALHAMENTO-DA-MAQUETE'] = DetalhamentoMaquete.new(arg.elements['DETALHAMENTO-DA-MAQUETE'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosMaquete

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoMaquete

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['FINALIDADE'] = arg.attributes['FINALIDADE']
		@atributos['OBJETO-REPRESENTADO'] = arg.attributes['OBJETO-REPRESENTADO']
		@atributos['MATERIAL-UTILIZADO'] = arg.attributes['MATERIAL-UTILIZADO']
		@atributos['INSTITUICAO-FINANCIADORA'] = arg.attributes['INSTITUICAO-FINANCIADORA']
		@atributos['FINALIDADE-INGLES'] = arg.attributes['FINALIDADE-INGLES']

		@elementos = Hash.new
	end


end


class OrganizacaoEvento

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-ORGANIZACAO-DE-EVENTO'] = DadosBasicosOrganizacaoEvento.new(arg.elements['DADOS-BASICOS-DA-ORGANIZACAO-DE-EVENTO'])
		@elementos['DETALHAMENTO-DA-ORGANIZACAO-DE-EVENTO'] = DetalhamentoOrganizacaoEvento.new(arg.elements['DETALHAMENTO-DA-ORGANIZACAO-DE-EVENTO'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosOrganizacaoEvento

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TIPO'] = arg.attributes['TIPO']
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoOrganizacaoEvento

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['INSTITUICAO-PROMOTORA'] = arg.attributes['INSTITUICAO-PROMOTORA']
		@atributos['DURACAO-EM-SEMANAS'] = arg.attributes['DURACAO-EM-SEMANAS']
		@atributos['FLAG-EVENTO-ITINERANTE'] = arg.attributes['FLAG-EVENTO-ITINERANTE']
		@atributos['FLAG-CATALOGO'] = arg.attributes['FLAG-CATALOGO']
		@atributos['LOCAL'] = arg.attributes['LOCAL']
		@atributos['CIDADE'] = arg.attributes['CIDADE']

		@elementos = Hash.new
	end


end


class OutraProducaoTecnica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-OUTRA-PRODUCAO-TECNICA'] = DadosBasicosOutraProducaoTecnica.new(arg.elements['DADOS-BASICOS-DE-OUTRA-PRODUCAO-TECNICA'])
		@elementos['DETALHAMENTO-DE-OUTRA-PRODUCAO-TECNICA'] = DetalhamentoOutraProducaoTecnica.new(arg.elements['DETALHAMENTO-DE-OUTRA-PRODUCAO-TECNICA'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['REGISTRO-OU-PATENTE'] = RegistroPatente.new(arg.elements['REGISTRO-OU-PATENTE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosOutraProducaoTecnica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['NATUREZA-INGLES'] = arg.attributes['NATUREZA-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoOutraProducaoTecnica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['FINALIDADE'] = arg.attributes['FINALIDADE']
		@atributos['INSTITUICAO-PROMOTORA'] = arg.attributes['INSTITUICAO-PROMOTORA']
		@atributos['LOCAL'] = arg.attributes['LOCAL']
		@atributos['CIDADE'] = arg.attributes['CIDADE']
		@atributos['FINALIDADE-INGLES'] = arg.attributes['FINALIDADE-INGLES']

		@elementos = Hash.new
	end


end


class ProgramaRadioTv

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DO-PROGRAMA-DE-RADIO-OU-TV'] = DadosBasicosProgramaRadioTv.new(arg.elements['DADOS-BASICOS-DO-PROGRAMA-DE-RADIO-OU-TV'])
		@elementos['DETALHAMENTO-DO-PROGRAMA-DE-RADIO-OU-TV'] = DetalhamentoProgramaRadioTv.new(arg.elements['DETALHAMENTO-DO-PROGRAMA-DE-RADIO-OU-TV'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosProgramaRadioTv

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoProgramaRadioTv

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['EMISSORA'] = arg.attributes['EMISSORA']
		@atributos['TEMA'] = arg.attributes['TEMA']
		@atributos['FORMATO-DATA-DA-APRESENTACAO'] = arg.attributes['FORMATO-DATA-DA-APRESENTACAO']
		@atributos['DATA-DA-APRESENTACAO'] = arg.attributes['DATA-DA-APRESENTACAO']
		@atributos['DURACAO-EM-MINUTOS'] = arg.attributes['DURACAO-EM-MINUTOS']
		@atributos['CIDADE'] = arg.attributes['CIDADE']
		@atributos['VEICULO-DE-DIVULGACAO'] = arg.attributes['VEICULO-DE-DIVULGACAO']

		@elementos = Hash.new
	end


end


class RelatorioPesquisa

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DO-RELATORIO-DE-PESQUISA'] = DadosBasicosRelatorioPesquisa.new(arg.elements['DADOS-BASICOS-DO-RELATORIO-DE-PESQUISA'])
		@elementos['DETALHAMENTO-DO-RELATORIO-DE-PESQUISA'] = DetalhamentoRelatorioPesquisa.new(arg.elements['DETALHAMENTO-DO-RELATORIO-DE-PESQUISA'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosRelatorioPesquisa

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoRelatorioPesquisa

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-PROJETO'] = arg.attributes['NOME-DO-PROJETO']
		@atributos['NUMERO-DE-PAGINAS'] = arg.attributes['NUMERO-DE-PAGINAS']
		@atributos['DISPONIBILIDADE'] = arg.attributes['DISPONIBILIDADE']
		@atributos['INSTITUICAO-FINANCIADORA'] = arg.attributes['INSTITUICAO-FINANCIADORA']

		@elementos = Hash.new
	end


end


class DadosBasicosMidiaSocialWebsiteBlog

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['NATUREZA-INGLES'] = arg.attributes['NATUREZA-INGLES']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoMidiaSocialWebsiteBlog

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TEMA'] = arg.attributes['TEMA']

		@elementos = Hash.new
	end


end


class OutraProducao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['PRODUCAO-ARTISTICA-CULTURAL'] = Array.new
		arg.elements.each('PRODUCAO-ARTISTICA-CULTURAL') do | i |
			@elementos['PRODUCAO-ARTISTICA-CULTURAL'].push(ProducaoArtisticaCultural.new(i))
		end
		@elementos['ORIENTACOES-CONCLUIDAS'] = Array.new
		arg.elements.each('ORIENTACOES-CONCLUIDAS') do | i |
			@elementos['ORIENTACOES-CONCLUIDAS'].push(OrientacoesConcluidas.new(i))
		end
		@elementos['DEMAIS-TRABALHOS'] = Array.new
		arg.elements.each('DEMAIS-TRABALHOS') do | i |
			@elementos['DEMAIS-TRABALHOS'].push(DemaisTrabalhos.new(i))
		end
	end


end


class ProducaoArtisticaCultural

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['APRESENTACAO-DE-OBRA-ARTISTICA'] = Array.new
		arg.elements.each('APRESENTACAO-DE-OBRA-ARTISTICA') do | i |
			@elementos['APRESENTACAO-DE-OBRA-ARTISTICA'].push(ApresentacaoObraArtistica.new(i))
		end
		@elementos['APRESENTACAO-EM-RADIO-OU-TV'] = Array.new
		arg.elements.each('APRESENTACAO-EM-RADIO-OU-TV') do | i |
			@elementos['APRESENTACAO-EM-RADIO-OU-TV'].push(ApresentacaoRadioTv.new(i))
		end
		@elementos['ARRANJO-MUSICAL'] = Array.new
		arg.elements.each('ARRANJO-MUSICAL') do | i |
			@elementos['ARRANJO-MUSICAL'].push(ArranjoMusical.new(i))
		end
		@elementos['COMPOSICAO-MUSICAL'] = Array.new
		arg.elements.each('COMPOSICAO-MUSICAL') do | i |
			@elementos['COMPOSICAO-MUSICAL'].push(ComposicaoMusical.new(i))
		end
		@elementos['CURSO-DE-CURTA-DURACAO'] = Array.new
		arg.elements.each('CURSO-DE-CURTA-DURACAO') do | i |
			@elementos['CURSO-DE-CURTA-DURACAO'].push(CursoCurtaDuracao.new(i))
		end
		@elementos['OBRA-DE-ARTES-VISUAIS'] = Array.new
		arg.elements.each('OBRA-DE-ARTES-VISUAIS') do | i |
			@elementos['OBRA-DE-ARTES-VISUAIS'].push(ObraArtesVisuais.new(i))
		end
		@elementos['OUTRA-PRODUCAO-ARTISTICA-CULTURAL'] = Array.new
		arg.elements.each('OUTRA-PRODUCAO-ARTISTICA-CULTURAL') do | i |
			@elementos['OUTRA-PRODUCAO-ARTISTICA-CULTURAL'].push(OutraProducaoArtisticaCultural.new(i))
		end
		@elementos['SONOPLASTIA'] = Array.new
		arg.elements.each('SONOPLASTIA') do | i |
			@elementos['SONOPLASTIA'].push(Sonoplastia.new(i))
		end
		@elementos['ARTES-CENICAS'] = Array.new
		arg.elements.each('ARTES-CENICAS') do | i |
			@elementos['ARTES-CENICAS'].push(ArtesCenicas.new(i))
		end
		@elementos['ARTES-VISUAIS'] = Array.new
		arg.elements.each('ARTES-VISUAIS') do | i |
			@elementos['ARTES-VISUAIS'].push(ArtesVisuais.new(i))
		end
		@elementos['MUSICA'] = Array.new
		arg.elements.each('MUSICA') do | i |
			@elementos['MUSICA'].push(Musica.new(i))
		end
	end


end


class ApresentacaoObraArtistica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-APRESENTACAO-DE-OBRA-ARTISTICA'] = DadosBasicosApresentacaoObraArtistica.new(arg.elements['DADOS-BASICOS-DA-APRESENTACAO-DE-OBRA-ARTISTICA'])
		@elementos['DETALHAMENTO-DA-APRESENTACAO-DE-OBRA-ARTISTICA'] = DetalhamentoApresentacaoObraArtistica.new(arg.elements['DETALHAMENTO-DA-APRESENTACAO-DE-OBRA-ARTISTICA'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosApresentacaoObraArtistica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoApresentacaoObraArtistica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TIPO-DE-EVENTO'] = arg.attributes['TIPO-DE-EVENTO']
		@atributos['ATIVIDADE-DOS-AUTORES'] = arg.attributes['ATIVIDADE-DOS-AUTORES']
		@atributos['FLAG-INEDITISMO-DA-OBRA'] = arg.attributes['FLAG-INEDITISMO-DA-OBRA']
		@atributos['PREMIACAO'] = arg.attributes['PREMIACAO']
		@atributos['OBRA-DE-REFERENCIA'] = arg.attributes['OBRA-DE-REFERENCIA']
		@atributos['AUTOR-DA-OBRA-DE-REFERENCIA'] = arg.attributes['AUTOR-DA-OBRA-DE-REFERENCIA']
		@atributos['ANO-DA-OBRA-DE-REFERENCIA'] = arg.attributes['ANO-DA-OBRA-DE-REFERENCIA']
		@atributos['DURACAO-EM-MINUTOS'] = arg.attributes['DURACAO-EM-MINUTOS']
		@atributos['INSTITUICAO-PROMOTORA-DO-EVENTO'] = arg.attributes['INSTITUICAO-PROMOTORA-DO-EVENTO']
		@atributos['LOCAL-DO-EVENTO'] = arg.attributes['LOCAL-DO-EVENTO']
		@atributos['CIDADE'] = arg.attributes['CIDADE']

		@elementos = Hash.new
	end


end


class ApresentacaoRadioTv

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-APRESENTACAO-EM-RADIO-OU-TV'] = DadosBasicosApresentacaoRadioTv.new(arg.elements['DADOS-BASICOS-DA-APRESENTACAO-EM-RADIO-OU-TV'])
		@elementos['DETALHAMENTO-DA-APRESENTACAO-EM-RADIO-OU-TV'] = DetalhamentoApresentacaoRadioTv.new(arg.elements['DETALHAMENTO-DA-APRESENTACAO-EM-RADIO-OU-TV'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosApresentacaoRadioTv

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoApresentacaoRadioTv

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['EMISSORA'] = arg.attributes['EMISSORA']
		@atributos['FORMATO-DATA-DE-APRESENTACAO'] = arg.attributes['FORMATO-DATA-DE-APRESENTACAO']
		@atributos['DATA-DE-APRESENTACAO'] = arg.attributes['DATA-DE-APRESENTACAO']
		@atributos['DURACAO-EM-MINUTOS'] = arg.attributes['DURACAO-EM-MINUTOS']
		@atributos['CIDADE'] = arg.attributes['CIDADE']

		@elementos = Hash.new
	end


end


class ArranjoMusical

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DO-ARRANJO-MUSICAL'] = DadosBasicosArranjoMusical.new(arg.elements['DADOS-BASICOS-DO-ARRANJO-MUSICAL'])
		@elementos['DETALHAMENTO-DO-ARRANJO-MUSICAL'] = DetalhamentoArranjoMusical.new(arg.elements['DETALHAMENTO-DO-ARRANJO-MUSICAL'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosArranjoMusical

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoArranjoMusical

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['AUTOR-DA-OBRA-DE-REFERENCIA'] = arg.attributes['AUTOR-DA-OBRA-DE-REFERENCIA']
		@atributos['ANO-DA-OBRA-DE-REFERENCIA'] = arg.attributes['ANO-DA-OBRA-DE-REFERENCIA']
		@atributos['FORMACAO-INSTRUMENTAL'] = arg.attributes['FORMACAO-INSTRUMENTAL']
		@atributos['REGISTRO-DE-DIREITO-AUTORAL'] = arg.attributes['REGISTRO-DE-DIREITO-AUTORAL']
		@atributos['PREMIACAO'] = arg.attributes['PREMIACAO']

		@elementos = Hash.new
	end


end


class ComposicaoMusical

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-COMPOSICAO-MUSICAL'] = DadosBasicosComposicaoMusical.new(arg.elements['DADOS-BASICOS-DA-COMPOSICAO-MUSICAL'])
		@elementos['DETALHAMENTO-DA-COMPOSICAO-MUSICAL'] = DetalhamentoComposicaoMusical.new(arg.elements['DETALHAMENTO-DA-COMPOSICAO-MUSICAL'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosComposicaoMusical

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoComposicaoMusical

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['FORMACAO-INSTRUMENTAL'] = arg.attributes['FORMACAO-INSTRUMENTAL']
		@atributos['NUMERO-DE-PAGINAS'] = arg.attributes['NUMERO-DE-PAGINAS']
		@atributos['REGISTRO-DE-DIREITO-AUTORAL'] = arg.attributes['REGISTRO-DE-DIREITO-AUTORAL']
		@atributos['PREMIACAO'] = arg.attributes['PREMIACAO']

		@elementos = Hash.new
	end


end


class CursoCurtaDuracao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DO-CURSO-DE-CURTA-DURACAO'] = DadosBasicosCursoCurtaDuracao.new(arg.elements['DADOS-BASICOS-DO-CURSO-DE-CURTA-DURACAO'])
		@elementos['DETALHAMENTO-DO-CURSO-DE-CURTA-DURACAO'] = DetalhamentoCursoCurtaDuracao.new(arg.elements['DETALHAMENTO-DO-CURSO-DE-CURTA-DURACAO'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosCursoCurtaDuracao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoCursoCurtaDuracao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['DURACAO'] = arg.attributes['DURACAO']
		@atributos['UNIDADE'] = arg.attributes['UNIDADE']
		@atributos['INSTITUICAO-PROMOTORA-DO-EVENTO'] = arg.attributes['INSTITUICAO-PROMOTORA-DO-EVENTO']
		@atributos['LOCAL-DO-EVENTO'] = arg.attributes['LOCAL-DO-EVENTO']
		@atributos['CIDADE'] = arg.attributes['CIDADE']

		@elementos = Hash.new
	end


end


class ObraArtesVisuais

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-OBRA-DE-ARTES-VISUAIS'] = DadosBasicosObraArtesVisuais.new(arg.elements['DADOS-BASICOS-DA-OBRA-DE-ARTES-VISUAIS'])
		@elementos['DETALHAMENTO-DA-OBRA-DE-ARTES-VISUAIS'] = DetalhamentoObraArtesVisuais.new(arg.elements['DETALHAMENTO-DA-OBRA-DE-ARTES-VISUAIS'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosObraArtesVisuais

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoObraArtesVisuais

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['MATERIAL-EMPREGADO'] = arg.attributes['MATERIAL-EMPREGADO']
		@atributos['TIPO-DE-EVENTO'] = arg.attributes['TIPO-DE-EVENTO']
		@atributos['EVENTO'] = arg.attributes['EVENTO']
		@atributos['PREMIACAO'] = arg.attributes['PREMIACAO']
		@atributos['ACERVO'] = arg.attributes['ACERVO']
		@atributos['INSTITUICAO-PROMOTORA'] = arg.attributes['INSTITUICAO-PROMOTORA']

		@elementos = Hash.new
	end


end


class OutraProducaoArtisticaCultural

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-OUTRA-PRODUCAO-ARTISTICA-CULTURAL'] = DadosBasicosOutraProducaoArtisticaCultural.new(arg.elements['DADOS-BASICOS-DE-OUTRA-PRODUCAO-ARTISTICA-CULTURAL'])
		@elementos['DETALHAMENTO-DE-OUTRA-PRODUCAO-ARTISTICA-CULTURAL'] = DetalhamentoOutraProducaoArtisticaCultural.new(arg.elements['DETALHAMENTO-DE-OUTRA-PRODUCAO-ARTISTICA-CULTURAL'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosOutraProducaoArtisticaCultural

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['NATUREZA-INGLES'] = arg.attributes['NATUREZA-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoOutraProducaoArtisticaCultural

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['INSTITUICAO-PROMOTORA-DO-EVENTO'] = arg.attributes['INSTITUICAO-PROMOTORA-DO-EVENTO']
		@atributos['LOCAL-DO-EVENTO'] = arg.attributes['LOCAL-DO-EVENTO']
		@atributos['CIDADE'] = arg.attributes['CIDADE']
		@atributos['EXPOSICAO'] = arg.attributes['EXPOSICAO']
		@atributos['PREMIACAO'] = arg.attributes['PREMIACAO']

		@elementos = Hash.new
	end


end


class Sonoplastia

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-SONOPLASTIA'] = DadosBasicosSonoplastia.new(arg.elements['DADOS-BASICOS-DE-SONOPLASTIA'])
		@elementos['DETALHAMENTO-DE-SONOPLASTIA'] = DetalhamentoSonoplastia.new(arg.elements['DETALHAMENTO-DE-SONOPLASTIA'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosSonoplastia

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoSonoplastia

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['FINALIDADE'] = arg.attributes['FINALIDADE']
		@atributos['PREMIACAO'] = arg.attributes['PREMIACAO']

		@elementos = Hash.new
	end


end


class ArtesCenicas

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-ARTES-CENICAS'] = DadosBasicosArtesCenicas.new(arg.elements['DADOS-BASICOS-DE-ARTES-CENICAS'])
		@elementos['DETALHAMENTO-DE-ARTES-CENICAS'] = DetalhamentoArtesCenicas.new(arg.elements['DETALHAMENTO-DE-ARTES-CENICAS'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosArtesCenicas

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoArtesCenicas

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TIPO-DE-EVENTO'] = arg.attributes['TIPO-DE-EVENTO']
		@atributos['ATIVIDADE-DOS-AUTORES'] = arg.attributes['ATIVIDADE-DOS-AUTORES']
		@atributos['DATA-ESTREIA'] = arg.attributes['DATA-ESTREIA']
		@atributos['DATA-ENCERRAMENTO'] = arg.attributes['DATA-ENCERRAMENTO']
		@atributos['LOCAL-DE-ESTREIA'] = arg.attributes['LOCAL-DE-ESTREIA']
		@atributos['PREMIACAO'] = arg.attributes['PREMIACAO']
		@atributos['INSTITUICAO-PROMOTORA-DO-PREMIO'] = arg.attributes['INSTITUICAO-PROMOTORA-DO-PREMIO']
		@atributos['OBRA-DE-REFERENCIA'] = arg.attributes['OBRA-DE-REFERENCIA']
		@atributos['AUTOR-DA-OBRA-DE-REFERENCIA'] = arg.attributes['AUTOR-DA-OBRA-DE-REFERENCIA']
		@atributos['ANO-DA-OBRA-DE-REFERENCIA'] = arg.attributes['ANO-DA-OBRA-DE-REFERENCIA']
		@atributos['DURACAO'] = arg.attributes['DURACAO']
		@atributos['TEMPORADA'] = arg.attributes['TEMPORADA']
		@atributos['INSTITUICAO-PROMOTORA-DO-EVENTO'] = arg.attributes['INSTITUICAO-PROMOTORA-DO-EVENTO']
		@atributos['LOCAL-DO-EVENTO'] = arg.attributes['LOCAL-DO-EVENTO']
		@atributos['CIDADE-DO-EVENTO'] = arg.attributes['CIDADE-DO-EVENTO']
		@atributos['FLAG-ITINERANTE'] = arg.attributes['FLAG-ITINERANTE']

		@elementos = Hash.new
	end


end


class ArtesVisuais

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-ARTES-VISUAIS'] = DadosBasicosArtesVisuais.new(arg.elements['DADOS-BASICOS-DE-ARTES-VISUAIS'])
		@elementos['DETALHAMENTO-DE-ARTES-VISUAIS'] = DetalhamentoArtesVisuais.new(arg.elements['DETALHAMENTO-DE-ARTES-VISUAIS'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosArtesVisuais

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoArtesVisuais

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['PREMIACAO'] = arg.attributes['PREMIACAO']
		@atributos['ATIVIDADE-DOS-AUTORES'] = arg.attributes['ATIVIDADE-DOS-AUTORES']
		@atributos['INSTITUICAO-PROMOTORA-DO-EVENTO'] = arg.attributes['INSTITUICAO-PROMOTORA-DO-EVENTO']
		@atributos['LOCAL-DO-EVENTO'] = arg.attributes['LOCAL-DO-EVENTO']
		@atributos['CIDADE-DO-EVENTO'] = arg.attributes['CIDADE-DO-EVENTO']
		@atributos['TEMPORADA'] = arg.attributes['TEMPORADA']

		@elementos = Hash.new
	end


end


class Musica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-MUSICA'] = DadosBasicosMusica.new(arg.elements['DADOS-BASICOS-DA-MUSICA'])
		@elementos['DETALHAMENTO-DA-MUSICA'] = DetalhamentoMusica.new(arg.elements['DETALHAMENTO-DA-MUSICA'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosMusica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoMusica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TIPO-DE-EVENTO'] = arg.attributes['TIPO-DE-EVENTO']
		@atributos['ATIVIDADE-DOS-AUTORES'] = arg.attributes['ATIVIDADE-DOS-AUTORES']
		@atributos['FORMACAO-INSTRUMENTAL'] = arg.attributes['FORMACAO-INSTRUMENTAL']
		@atributos['FLAG-INEDITISMO-DA-OBRA'] = arg.attributes['FLAG-INEDITISMO-DA-OBRA']
		@atributos['DATA-ESTREIA'] = arg.attributes['DATA-ESTREIA']
		@atributos['DATA-ENCERRAMENTO'] = arg.attributes['DATA-ENCERRAMENTO']
		@atributos['LOCAL-DE-ESTREIA'] = arg.attributes['LOCAL-DE-ESTREIA']
		@atributos['PREMIACAO'] = arg.attributes['PREMIACAO']
		@atributos['INSTITUICAO-PROMOTORA-DO-PREMIO'] = arg.attributes['INSTITUICAO-PROMOTORA-DO-PREMIO']
		@atributos['OBRA-DE-REFERENCIA'] = arg.attributes['OBRA-DE-REFERENCIA']
		@atributos['AUTOR-DA-OBRA-DE-REFERENCIA'] = arg.attributes['AUTOR-DA-OBRA-DE-REFERENCIA']
		@atributos['ANO-DA-OBRA-DE-REFERENCIA'] = arg.attributes['ANO-DA-OBRA-DE-REFERENCIA']
		@atributos['DURACAO'] = arg.attributes['DURACAO']
		@atributos['TEMPORADA'] = arg.attributes['TEMPORADA']
		@atributos['INSTITUICAO-PROMOTORA-DO-EVENTO'] = arg.attributes['INSTITUICAO-PROMOTORA-DO-EVENTO']
		@atributos['LOCAL-DO-EVENTO'] = arg.attributes['LOCAL-DO-EVENTO']
		@atributos['CIDADE-DO-EVENTO'] = arg.attributes['CIDADE-DO-EVENTO']

		@elementos = Hash.new
	end


end


class OrientacoesConcluidas

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['ORIENTACOES-CONCLUIDAS-PARA-MESTRADO'] = Array.new
		arg.elements.each('ORIENTACOES-CONCLUIDAS-PARA-MESTRADO') do | i |
			@elementos['ORIENTACOES-CONCLUIDAS-PARA-MESTRADO'].push(OrientacoesConcluidasParaMestrado.new(i))
		end
		@elementos['ORIENTACOES-CONCLUIDAS-PARA-DOUTORADO'] = Array.new
		arg.elements.each('ORIENTACOES-CONCLUIDAS-PARA-DOUTORADO') do | i |
			@elementos['ORIENTACOES-CONCLUIDAS-PARA-DOUTORADO'].push(OrientacoesConcluidasParaDoutorado.new(i))
		end
		@elementos['ORIENTACOES-CONCLUIDAS-PARA-POS-DOUTORADO'] = Array.new
		arg.elements.each('ORIENTACOES-CONCLUIDAS-PARA-POS-DOUTORADO') do | i |
			@elementos['ORIENTACOES-CONCLUIDAS-PARA-POS-DOUTORADO'].push(OrientacoesConcluidasParaPosDoutorado.new(i))
		end
		@elementos['OUTRAS-ORIENTACOES-CONCLUIDAS'] = Array.new
		arg.elements.each('OUTRAS-ORIENTACOES-CONCLUIDAS') do | i |
			@elementos['OUTRAS-ORIENTACOES-CONCLUIDAS'].push(OutrasOrientacoesConcluidas.new(i))
		end
	end


end


class OrientacoesConcluidasParaMestrado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-ORIENTACOES-CONCLUIDAS-PARA-MESTRADO'] = DadosBasicosOrientacoesConcluidasParaMestrado.new(arg.elements['DADOS-BASICOS-DE-ORIENTACOES-CONCLUIDAS-PARA-MESTRADO'])
		@elementos['DETALHAMENTO-DE-ORIENTACOES-CONCLUIDAS-PARA-MESTRADO'] = DetalhamentoOrientacoesConcluidasParaMestrado.new(arg.elements['DETALHAMENTO-DE-ORIENTACOES-CONCLUIDAS-PARA-MESTRADO'])
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosOrientacoesConcluidasParaMestrado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TIPO'] = arg.attributes['TIPO']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoOrientacoesConcluidasParaMestrado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TIPO-DE-ORIENTACAO'] = arg.attributes['TIPO-DE-ORIENTACAO']
		@atributos['NOME-DO-ORIENTADO'] = arg.attributes['NOME-DO-ORIENTADO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-DA-INSTITUICAO'] = arg.attributes['NOME-DA-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-DO-CURSO'] = arg.attributes['NOME-DO-CURSO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-DA-AGENCIA'] = arg.attributes['NOME-DA-AGENCIA']
		@atributos['NUMERO-DE-PAGINAS'] = arg.attributes['NUMERO-DE-PAGINAS']
		@atributos['NUMERO-ID-ORIENTADO'] = arg.attributes['NUMERO-ID-ORIENTADO']
		@atributos['NOME-DO-CURSO-INGLES'] = arg.attributes['NOME-DO-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class OrientacoesConcluidasParaDoutorado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-ORIENTACOES-CONCLUIDAS-PARA-DOUTORADO'] = DadosBasicosOrientacoesConcluidasParaDoutorado.new(arg.elements['DADOS-BASICOS-DE-ORIENTACOES-CONCLUIDAS-PARA-DOUTORADO'])
		@elementos['DETALHAMENTO-DE-ORIENTACOES-CONCLUIDAS-PARA-DOUTORADO'] = DetalhamentoOrientacoesConcluidasParaDoutorado.new(arg.elements['DETALHAMENTO-DE-ORIENTACOES-CONCLUIDAS-PARA-DOUTORADO'])
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosOrientacoesConcluidasParaDoutorado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoOrientacoesConcluidasParaDoutorado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TIPO-DE-ORIENTACAO'] = arg.attributes['TIPO-DE-ORIENTACAO']
		@atributos['NOME-DO-ORIENTADO'] = arg.attributes['NOME-DO-ORIENTADO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-DA-INSTITUICAO'] = arg.attributes['NOME-DA-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-DO-CURSO'] = arg.attributes['NOME-DO-CURSO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-DA-AGENCIA'] = arg.attributes['NOME-DA-AGENCIA']
		@atributos['NUMERO-DE-PAGINAS'] = arg.attributes['NUMERO-DE-PAGINAS']
		@atributos['NUMERO-ID-ORIENTADO'] = arg.attributes['NUMERO-ID-ORIENTADO']
		@atributos['NOME-DO-CURSO-INGLES'] = arg.attributes['NOME-DO-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class OrientacoesConcluidasParaPosDoutorado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-ORIENTACOES-CONCLUIDAS-PARA-POS-DOUTORADO'] = DadosBasicosOrientacoesConcluidasParaPosDoutorado.new(arg.elements['DADOS-BASICOS-DE-ORIENTACOES-CONCLUIDAS-PARA-POS-DOUTORADO'])
		@elementos['DETALHAMENTO-DE-ORIENTACOES-CONCLUIDAS-PARA-POS-DOUTORADO'] = DetalhamentoOrientacoesConcluidasParaPosDoutorado.new(arg.elements['DETALHAMENTO-DE-ORIENTACOES-CONCLUIDAS-PARA-POS-DOUTORADO'])
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosOrientacoesConcluidasParaPosDoutorado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoOrientacoesConcluidasParaPosDoutorado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TIPO-DE-ORIENTACAO'] = arg.attributes['TIPO-DE-ORIENTACAO']
		@atributos['NOME-DO-ORIENTADO'] = arg.attributes['NOME-DO-ORIENTADO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-DA-INSTITUICAO'] = arg.attributes['NOME-DA-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-DO-CURSO'] = arg.attributes['NOME-DO-CURSO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-DA-AGENCIA'] = arg.attributes['NOME-DA-AGENCIA']
		@atributos['NUMERO-DE-PAGINAS'] = arg.attributes['NUMERO-DE-PAGINAS']
		@atributos['NUMERO-ID-ORIENTADO'] = arg.attributes['NUMERO-ID-ORIENTADO']
		@atributos['NOME-DO-CURSO-INGLES'] = arg.attributes['NOME-DO-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class OutrasOrientacoesConcluidas

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-OUTRAS-ORIENTACOES-CONCLUIDAS'] = DadosBasicosOutrasOrientacoesConcluidas.new(arg.elements['DADOS-BASICOS-DE-OUTRAS-ORIENTACOES-CONCLUIDAS'])
		@elementos['DETALHAMENTO-DE-OUTRAS-ORIENTACOES-CONCLUIDAS'] = DetalhamentoOutrasOrientacoesConcluidas.new(arg.elements['DETALHAMENTO-DE-OUTRAS-ORIENTACOES-CONCLUIDAS'])
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosOutrasOrientacoesConcluidas

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TIPO'] = arg.attributes['TIPO']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['TIPO-INGLES'] = arg.attributes['TIPO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoOutrasOrientacoesConcluidas

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-ORIENTADO'] = arg.attributes['NOME-DO-ORIENTADO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-DA-INSTITUICAO'] = arg.attributes['NOME-DA-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-DO-CURSO'] = arg.attributes['NOME-DO-CURSO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-DA-AGENCIA'] = arg.attributes['NOME-DA-AGENCIA']
		@atributos['TIPO-DE-ORIENTACAO-CONCLUIDA'] = arg.attributes['TIPO-DE-ORIENTACAO-CONCLUIDA']
		@atributos['NUMERO-DE-PAGINAS'] = arg.attributes['NUMERO-DE-PAGINAS']
		@atributos['NUMERO-ID-ORIENTADO'] = arg.attributes['NUMERO-ID-ORIENTADO']
		@atributos['NOME-DO-CURSO-INGLES'] = arg.attributes['NOME-DO-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class DemaisTrabalhos

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-DEMAIS-TRABALHOS'] = DadosBasicosDemaisTrabalhos.new(arg.elements['DADOS-BASICOS-DE-DEMAIS-TRABALHOS'])
		@elementos['DETALHAMENTO-DE-DEMAIS-TRABALHOS'] = DetalhamentoDemaisTrabalhos.new(arg.elements['DETALHAMENTO-DE-DEMAIS-TRABALHOS'])
		@elementos['AUTORES'] = Array.new
		arg.elements.each('AUTORES') do | i |
			@elementos['AUTORES'].push(Autores.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosDemaisTrabalhos

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['NATUREZA-INGLES'] = arg.attributes['NATUREZA-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoDemaisTrabalhos

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['FINALIDADE'] = arg.attributes['FINALIDADE']
		@atributos['LOCAL'] = arg.attributes['LOCAL']

		@elementos = Hash.new
	end


end


class DadosComplementares

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['FORMACAO-COMPLEMENTAR'] = Array.new
		arg.elements.each('FORMACAO-COMPLEMENTAR') do | i |
			@elementos['FORMACAO-COMPLEMENTAR'].push(FormacaoComplementar.new(i))
		end
		@elementos['PARTICIPACAO-EM-BANCA-TRABALHOS-CONCLUSAO'] = ParticipacaoBancaTrabalhosConclusao.new(arg.elements['PARTICIPACAO-EM-BANCA-TRABALHOS-CONCLUSAO'])
		@elementos['PARTICIPACAO-EM-BANCA-JULGADORA'] = ParticipacaoBancaJulgadora.new(arg.elements['PARTICIPACAO-EM-BANCA-JULGADORA'])
		@elementos['PARTICIPACAO-EM-EVENTOS-CONGRESSOS'] = ParticipacaoEventosCongressos.new(arg.elements['PARTICIPACAO-EM-EVENTOS-CONGRESSOS'])
		@elementos['ORIENTACOES-EM-ANDAMENTO'] = OrientacoesAndamento.new(arg.elements['ORIENTACOES-EM-ANDAMENTO'])
		@elementos['INFORMACOES-ADICIONAIS-INSTITUICOES'] = InformacoesAdicionaisInstituicoes.new(arg.elements['INFORMACOES-ADICIONAIS-INSTITUICOES'])
		@elementos['INFORMACOES-ADICIONAIS-CURSOS'] = InformacoesAdicionaisCursos.new(arg.elements['INFORMACOES-ADICIONAIS-CURSOS'])
	end

		def toTEX
		end

end


class FormacaoComplementar

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['FORMACAO-COMPLEMENTAR-DE-EXTENSAO-UNIVERSITARIA'] = Array.new
		arg.elements.each('FORMACAO-COMPLEMENTAR-DE-EXTENSAO-UNIVERSITARIA') do | i |
			@elementos['FORMACAO-COMPLEMENTAR-DE-EXTENSAO-UNIVERSITARIA'].push(FormacaoComplementarExtensaoUniversitaria.new(i))
		end
		@elementos['MBA'] = Array.new
		arg.elements.each('MBA') do | i |
			@elementos['MBA'].push(Mba.new(i))
		end
		@elementos['FORMACAO-COMPLEMENTAR-CURSO-DE-CURTA-DURACAO'] = Array.new
		arg.elements.each('FORMACAO-COMPLEMENTAR-CURSO-DE-CURTA-DURACAO') do | i |
			@elementos['FORMACAO-COMPLEMENTAR-CURSO-DE-CURTA-DURACAO'].push(FormacaoComplementarCursoCurtaDuracao.new(i))
		end
		@elementos['OUTROS'] = Array.new
		arg.elements.each('OUTROS') do | i |
			@elementos['OUTROS'].push(Outros.new(i))
		end
	end


end


class FormacaoComplementarExtensaoUniversitaria

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FORMACAO'] = arg.attributes['SEQUENCIA-FORMACAO']
		@atributos['NIVEL'] = arg.attributes['NIVEL']
		@atributos['CARGA-HORARIA'] = arg.attributes['CARGA-HORARIA']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['STATUS-DO-CURSO'] = arg.attributes['STATUS-DO-CURSO']
		@atributos['ANO-DE-INICIO'] = arg.attributes['ANO-DE-INICIO']
		@atributos['ANO-DE-CONCLUSAO'] = arg.attributes['ANO-DE-CONCLUSAO']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class Mba

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FORMACAO'] = arg.attributes['SEQUENCIA-FORMACAO']
		@atributos['NIVEL'] = arg.attributes['NIVEL']
		@atributos['CARGA-HORARIA'] = arg.attributes['CARGA-HORARIA']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['STATUS-DO-CURSO'] = arg.attributes['STATUS-DO-CURSO']
		@atributos['ANO-DE-INICIO'] = arg.attributes['ANO-DE-INICIO']
		@atributos['ANO-DE-CONCLUSAO'] = arg.attributes['ANO-DE-CONCLUSAO']
		@atributos['ANO-DE-OBTENCAO-DO-TITULO'] = arg.attributes['ANO-DE-OBTENCAO-DO-TITULO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-AGENCIA'] = arg.attributes['NOME-AGENCIA']
		@atributos['TITULO-DA-MONOGRAFIA'] = arg.attributes['TITULO-DA-MONOGRAFIA']
		@atributos['NOME-COMPLETO-DO-ORIENTADOR'] = arg.attributes['NOME-COMPLETO-DO-ORIENTADOR']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
	end


end


class FormacaoComplementarCursoCurtaDuracao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FORMACAO'] = arg.attributes['SEQUENCIA-FORMACAO']
		@atributos['NIVEL'] = arg.attributes['NIVEL']
		@atributos['CARGA-HORARIA'] = arg.attributes['CARGA-HORARIA']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['STATUS-DO-CURSO'] = arg.attributes['STATUS-DO-CURSO']
		@atributos['ANO-DE-INICIO'] = arg.attributes['ANO-DE-INICIO']
		@atributos['ANO-DE-CONCLUSAO'] = arg.attributes['ANO-DE-CONCLUSAO']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class Outros

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-FORMACAO'] = arg.attributes['SEQUENCIA-FORMACAO']
		@atributos['NIVEL'] = arg.attributes['NIVEL']
		@atributos['CARGA-HORARIA'] = arg.attributes['CARGA-HORARIA']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['STATUS-DO-CURSO'] = arg.attributes['STATUS-DO-CURSO']
		@atributos['ANO-DE-INICIO'] = arg.attributes['ANO-DE-INICIO']
		@atributos['ANO-DE-CONCLUSAO'] = arg.attributes['ANO-DE-CONCLUSAO']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class ParticipacaoBancaTrabalhosConclusao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['PARTICIPACAO-EM-BANCA-DE-MESTRADO'] = Array.new
		arg.elements.each('PARTICIPACAO-EM-BANCA-DE-MESTRADO') do | i |
			@elementos['PARTICIPACAO-EM-BANCA-DE-MESTRADO'].push(ParticipacaoBancaMestrado.new(i))
		end
		@elementos['PARTICIPACAO-EM-BANCA-DE-DOUTORADO'] = Array.new
		arg.elements.each('PARTICIPACAO-EM-BANCA-DE-DOUTORADO') do | i |
			@elementos['PARTICIPACAO-EM-BANCA-DE-DOUTORADO'].push(ParticipacaoBancaDoutorado.new(i))
		end
		@elementos['PARTICIPACAO-EM-BANCA-DE-EXAME-QUALIFICACAO'] = Array.new
		arg.elements.each('PARTICIPACAO-EM-BANCA-DE-EXAME-QUALIFICACAO') do | i |
			@elementos['PARTICIPACAO-EM-BANCA-DE-EXAME-QUALIFICACAO'].push(ParticipacaoBancaExameQualificacao.new(i))
		end
		@elementos['PARTICIPACAO-EM-BANCA-DE-APERFEICOAMENTO-ESPECIALIZACAO'] = Array.new
		arg.elements.each('PARTICIPACAO-EM-BANCA-DE-APERFEICOAMENTO-ESPECIALIZACAO') do | i |
			@elementos['PARTICIPACAO-EM-BANCA-DE-APERFEICOAMENTO-ESPECIALIZACAO'].push(ParticipacaoBancaAperfeicoamentoEspecializacao.new(i))
		end
		@elementos['PARTICIPACAO-EM-BANCA-DE-GRADUACAO'] = Array.new
		arg.elements.each('PARTICIPACAO-EM-BANCA-DE-GRADUACAO') do | i |
			@elementos['PARTICIPACAO-EM-BANCA-DE-GRADUACAO'].push(ParticipacaoBancaGraduacao.new(i))
		end
		@elementos['OUTRAS-PARTICIPACOES-EM-BANCA'] = Array.new
		arg.elements.each('OUTRAS-PARTICIPACOES-EM-BANCA') do | i |
			@elementos['OUTRAS-PARTICIPACOES-EM-BANCA'].push(OutrasParticipacoesBanca.new(i))
		end
	end


end


class ParticipacaoBancaMestrado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-PARTICIPACAO-EM-BANCA-DE-MESTRADO'] = DadosBasicosParticipacaoBancaMestrado.new(arg.elements['DADOS-BASICOS-DA-PARTICIPACAO-EM-BANCA-DE-MESTRADO'])
		@elementos['DETALHAMENTO-DA-PARTICIPACAO-EM-BANCA-DE-MESTRADO'] = DetalhamentoParticipacaoBancaMestrado.new(arg.elements['DETALHAMENTO-DA-PARTICIPACAO-EM-BANCA-DE-MESTRADO'])
		@elementos['PARTICIPANTE-BANCA'] = Array.new
		arg.elements.each('PARTICIPANTE-BANCA') do | i |
			@elementos['PARTICIPANTE-BANCA'].push(ParticipanteBanca.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosParticipacaoBancaMestrado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TIPO'] = arg.attributes['TIPO']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoParticipacaoBancaMestrado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-CANDIDATO'] = arg.attributes['NOME-DO-CANDIDATO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class ParticipanteBanca

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-COMPLETO-DO-PARTICIPANTE-DA-BANCA'] = arg.attributes['NOME-COMPLETO-DO-PARTICIPANTE-DA-BANCA']
		@atributos['NOME-PARA-CITACAO-DO-PARTICIPANTE-DA-BANCA'] = arg.attributes['NOME-PARA-CITACAO-DO-PARTICIPANTE-DA-BANCA']
		@atributos['ORDEM-PARTICIPANTE'] = arg.attributes['ORDEM-PARTICIPANTE']
		@atributos['CPF-DO-PARTICIPANTE-DA-BANCA'] = arg.attributes['CPF-DO-PARTICIPANTE-DA-BANCA']
		@atributos['NRO-ID-CNPQ'] = arg.attributes['NRO-ID-CNPQ']

		@elementos = Hash.new
	end


end


class ParticipacaoBancaDoutorado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-PARTICIPACAO-EM-BANCA-DE-DOUTORADO'] = DadosBasicosParticipacaoBancaDoutorado.new(arg.elements['DADOS-BASICOS-DA-PARTICIPACAO-EM-BANCA-DE-DOUTORADO'])
		@elementos['DETALHAMENTO-DA-PARTICIPACAO-EM-BANCA-DE-DOUTORADO'] = DetalhamentoParticipacaoBancaDoutorado.new(arg.elements['DETALHAMENTO-DA-PARTICIPACAO-EM-BANCA-DE-DOUTORADO'])
		@elementos['PARTICIPANTE-BANCA'] = Array.new
		arg.elements.each('PARTICIPANTE-BANCA') do | i |
			@elementos['PARTICIPANTE-BANCA'].push(ParticipanteBanca.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosParticipacaoBancaDoutorado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoParticipacaoBancaDoutorado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-CANDIDATO'] = arg.attributes['NOME-DO-CANDIDATO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class ParticipacaoBancaExameQualificacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-PARTICIPACAO-EM-BANCA-DE-EXAME-QUALIFICACAO'] = DadosBasicosParticipacaoBancaExameQualificacao.new(arg.elements['DADOS-BASICOS-DA-PARTICIPACAO-EM-BANCA-DE-EXAME-QUALIFICACAO'])
		@elementos['DETALHAMENTO-DA-PARTICIPACAO-EM-BANCA-DE-EXAME-QUALIFICACAO'] = DetalhamentoParticipacaoBancaExameQualificacao.new(arg.elements['DETALHAMENTO-DA-PARTICIPACAO-EM-BANCA-DE-EXAME-QUALIFICACAO'])
		@elementos['PARTICIPANTE-BANCA'] = Array.new
		arg.elements.each('PARTICIPANTE-BANCA') do | i |
			@elementos['PARTICIPANTE-BANCA'].push(ParticipanteBanca.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosParticipacaoBancaExameQualificacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoParticipacaoBancaExameQualificacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-CANDIDATO'] = arg.attributes['NOME-DO-CANDIDATO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class ParticipacaoBancaAperfeicoamentoEspecializacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-PARTICIPACAO-EM-BANCA-DE-APERFEICOAMENTO-ESPECIALIZACAO'] = DadosBasicosParticipacaoBancaAperfeicoamentoEspecializacao.new(arg.elements['DADOS-BASICOS-DA-PARTICIPACAO-EM-BANCA-DE-APERFEICOAMENTO-ESPECIALIZACAO'])
		@elementos['DETALHAMENTO-DA-PARTICIPACAO-EM-BANCA-DE-APERFEICOAMENTO-ESPECIALIZACAO'] = DetalhamentoParticipacaoBancaAperfeicoamentoEspecializacao.new(arg.elements['DETALHAMENTO-DA-PARTICIPACAO-EM-BANCA-DE-APERFEICOAMENTO-ESPECIALIZACAO'])
		@elementos['PARTICIPANTE-BANCA'] = Array.new
		arg.elements.each('PARTICIPANTE-BANCA') do | i |
			@elementos['PARTICIPANTE-BANCA'].push(ParticipanteBanca.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosParticipacaoBancaAperfeicoamentoEspecializacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoParticipacaoBancaAperfeicoamentoEspecializacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-CANDIDATO'] = arg.attributes['NOME-DO-CANDIDATO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class ParticipacaoBancaGraduacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-PARTICIPACAO-EM-BANCA-DE-GRADUACAO'] = DadosBasicosParticipacaoBancaGraduacao.new(arg.elements['DADOS-BASICOS-DA-PARTICIPACAO-EM-BANCA-DE-GRADUACAO'])
		@elementos['DETALHAMENTO-DA-PARTICIPACAO-EM-BANCA-DE-GRADUACAO'] = DetalhamentoParticipacaoBancaGraduacao.new(arg.elements['DETALHAMENTO-DA-PARTICIPACAO-EM-BANCA-DE-GRADUACAO'])
		@elementos['PARTICIPANTE-BANCA'] = Array.new
		arg.elements.each('PARTICIPANTE-BANCA') do | i |
			@elementos['PARTICIPANTE-BANCA'].push(ParticipanteBanca.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosParticipacaoBancaGraduacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoParticipacaoBancaGraduacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-CANDIDATO'] = arg.attributes['NOME-DO-CANDIDATO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class OutrasParticipacoesBanca

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-OUTRAS-PARTICIPACOES-EM-BANCA'] = DadosBasicosOutrasParticipacoesBanca.new(arg.elements['DADOS-BASICOS-DE-OUTRAS-PARTICIPACOES-EM-BANCA'])
		@elementos['DETALHAMENTO-DE-OUTRAS-PARTICIPACOES-EM-BANCA'] = DetalhamentoOutrasParticipacoesBanca.new(arg.elements['DETALHAMENTO-DE-OUTRAS-PARTICIPACOES-EM-BANCA'])
		@elementos['PARTICIPANTE-BANCA'] = Array.new
		arg.elements.each('PARTICIPANTE-BANCA') do | i |
			@elementos['PARTICIPANTE-BANCA'].push(ParticipanteBanca.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosOutrasParticipacoesBanca

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TIPO'] = arg.attributes['TIPO']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['TIPO-INGLES'] = arg.attributes['TIPO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoOutrasParticipacoesBanca

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-CANDIDATO'] = arg.attributes['NOME-DO-CANDIDATO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class ParticipacaoBancaJulgadora

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['BANCA-JULGADORA-PARA-PROFESSOR-TITULAR'] = Array.new
		arg.elements.each('BANCA-JULGADORA-PARA-PROFESSOR-TITULAR') do | i |
			@elementos['BANCA-JULGADORA-PARA-PROFESSOR-TITULAR'].push(BancaJulgadoraParaProfessorTitular.new(i))
		end
		@elementos['BANCA-JULGADORA-PARA-CONCURSO-PUBLICO'] = Array.new
		arg.elements.each('BANCA-JULGADORA-PARA-CONCURSO-PUBLICO') do | i |
			@elementos['BANCA-JULGADORA-PARA-CONCURSO-PUBLICO'].push(BancaJulgadoraParaConcursoPublico.new(i))
		end
		@elementos['BANCA-JULGADORA-PARA-LIVRE-DOCENCIA'] = Array.new
		arg.elements.each('BANCA-JULGADORA-PARA-LIVRE-DOCENCIA') do | i |
			@elementos['BANCA-JULGADORA-PARA-LIVRE-DOCENCIA'].push(BancaJulgadoraParaLivreDocencia.new(i))
		end
		@elementos['BANCA-JULGADORA-PARA-AVALIACAO-CURSOS'] = Array.new
		arg.elements.each('BANCA-JULGADORA-PARA-AVALIACAO-CURSOS') do | i |
			@elementos['BANCA-JULGADORA-PARA-AVALIACAO-CURSOS'].push(BancaJulgadoraParaAvaliacaoCursos.new(i))
		end
		@elementos['OUTRAS-BANCAS-JULGADORAS'] = Array.new
		arg.elements.each('OUTRAS-BANCAS-JULGADORAS') do | i |
			@elementos['OUTRAS-BANCAS-JULGADORAS'].push(OutrasBancasJulgadoras.new(i))
		end
	end


end


class BancaJulgadoraParaProfessorTitular

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-BANCA-JULGADORA-PARA-PROFESSOR-TITULAR'] = DadosBasicosBancaJulgadoraParaProfessorTitular.new(arg.elements['DADOS-BASICOS-DA-BANCA-JULGADORA-PARA-PROFESSOR-TITULAR'])
		@elementos['DETALHAMENTO-DA-BANCA-JULGADORA-PARA-PROFESSOR-TITULAR'] = DetalhamentoBancaJulgadoraParaProfessorTitular.new(arg.elements['DETALHAMENTO-DA-BANCA-JULGADORA-PARA-PROFESSOR-TITULAR'])
		@elementos['PARTICIPANTE-BANCA'] = Array.new
		arg.elements.each('PARTICIPANTE-BANCA') do | i |
			@elementos['PARTICIPANTE-BANCA'].push(ParticipanteBanca.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosBancaJulgadoraParaProfessorTitular

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoBancaJulgadoraParaProfessorTitular

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']

		@elementos = Hash.new
	end


end


class BancaJulgadoraParaConcursoPublico

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-BANCA-JULGADORA-PARA-CONCURSO-PUBLICO'] = DadosBasicosBancaJulgadoraParaConcursoPublico.new(arg.elements['DADOS-BASICOS-DA-BANCA-JULGADORA-PARA-CONCURSO-PUBLICO'])
		@elementos['DETALHAMENTO-DA-BANCA-JULGADORA-PARA-CONCURSO-PUBLICO'] = DetalhamentoBancaJulgadoraParaConcursoPublico.new(arg.elements['DETALHAMENTO-DA-BANCA-JULGADORA-PARA-CONCURSO-PUBLICO'])
		@elementos['PARTICIPANTE-BANCA'] = Array.new
		arg.elements.each('PARTICIPANTE-BANCA') do | i |
			@elementos['PARTICIPANTE-BANCA'].push(ParticipanteBanca.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosBancaJulgadoraParaConcursoPublico

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoBancaJulgadoraParaConcursoPublico

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']

		@elementos = Hash.new
	end


end


class BancaJulgadoraParaLivreDocencia

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-BANCA-JULGADORA-PARA-LIVRE-DOCENCIA'] = DadosBasicosBancaJulgadoraParaLivreDocencia.new(arg.elements['DADOS-BASICOS-DA-BANCA-JULGADORA-PARA-LIVRE-DOCENCIA'])
		@elementos['DETALHAMENTO-DA-BANCA-JULGADORA-PARA-LIVRE-DOCENCIA'] = DetalhamentoBancaJulgadoraParaLivreDocencia.new(arg.elements['DETALHAMENTO-DA-BANCA-JULGADORA-PARA-LIVRE-DOCENCIA'])
		@elementos['PARTICIPANTE-BANCA'] = Array.new
		arg.elements.each('PARTICIPANTE-BANCA') do | i |
			@elementos['PARTICIPANTE-BANCA'].push(ParticipanteBanca.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosBancaJulgadoraParaLivreDocencia

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoBancaJulgadoraParaLivreDocencia

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']

		@elementos = Hash.new
	end


end


class BancaJulgadoraParaAvaliacaoCursos

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-BANCA-JULGADORA-PARA-AVALIACAO-CURSOS'] = DadosBasicosBancaJulgadoraParaAvaliacaoCursos.new(arg.elements['DADOS-BASICOS-DA-BANCA-JULGADORA-PARA-AVALIACAO-CURSOS'])
		@elementos['DETALHAMENTO-DA-BANCA-JULGADORA-PARA-AVALIACAO-CURSOS'] = DetalhamentoBancaJulgadoraParaAvaliacaoCursos.new(arg.elements['DETALHAMENTO-DA-BANCA-JULGADORA-PARA-AVALIACAO-CURSOS'])
		@elementos['PARTICIPANTE-BANCA'] = Array.new
		arg.elements.each('PARTICIPANTE-BANCA') do | i |
			@elementos['PARTICIPANTE-BANCA'].push(ParticipanteBanca.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosBancaJulgadoraParaAvaliacaoCursos

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoBancaJulgadoraParaAvaliacaoCursos

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']

		@elementos = Hash.new
	end


end


class OutrasBancasJulgadoras

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-OUTRAS-BANCAS-JULGADORAS'] = DadosBasicosOutrasBancasJulgadoras.new(arg.elements['DADOS-BASICOS-DE-OUTRAS-BANCAS-JULGADORAS'])
		@elementos['DETALHAMENTO-DE-OUTRAS-BANCAS-JULGADORAS'] = DetalhamentoOutrasBancasJulgadoras.new(arg.elements['DETALHAMENTO-DE-OUTRAS-BANCAS-JULGADORAS'])
		@elementos['PARTICIPANTE-BANCA'] = Array.new
		arg.elements.each('PARTICIPANTE-BANCA') do | i |
			@elementos['PARTICIPANTE-BANCA'].push(ParticipanteBanca.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosOutrasBancasJulgadoras

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TIPO'] = arg.attributes['TIPO']
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['TIPO-INGLES'] = arg.attributes['TIPO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoOutrasBancasJulgadoras

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']

		@elementos = Hash.new
	end


end


class ParticipacaoEventosCongressos

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['PARTICIPACAO-EM-CONGRESSO'] = Array.new
		arg.elements.each('PARTICIPACAO-EM-CONGRESSO') do | i |
			@elementos['PARTICIPACAO-EM-CONGRESSO'].push(ParticipacaoCongresso.new(i))
		end
		@elementos['PARTICIPACAO-EM-FEIRA'] = Array.new
		arg.elements.each('PARTICIPACAO-EM-FEIRA') do | i |
			@elementos['PARTICIPACAO-EM-FEIRA'].push(ParticipacaoFeira.new(i))
		end
		@elementos['PARTICIPACAO-EM-SEMINARIO'] = Array.new
		arg.elements.each('PARTICIPACAO-EM-SEMINARIO') do | i |
			@elementos['PARTICIPACAO-EM-SEMINARIO'].push(ParticipacaoSeminario.new(i))
		end
		@elementos['PARTICIPACAO-EM-SIMPOSIO'] = Array.new
		arg.elements.each('PARTICIPACAO-EM-SIMPOSIO') do | i |
			@elementos['PARTICIPACAO-EM-SIMPOSIO'].push(ParticipacaoSimposio.new(i))
		end
		@elementos['PARTICIPACAO-EM-OFICINA'] = Array.new
		arg.elements.each('PARTICIPACAO-EM-OFICINA') do | i |
			@elementos['PARTICIPACAO-EM-OFICINA'].push(ParticipacaoOficina.new(i))
		end
		@elementos['PARTICIPACAO-EM-ENCONTRO'] = Array.new
		arg.elements.each('PARTICIPACAO-EM-ENCONTRO') do | i |
			@elementos['PARTICIPACAO-EM-ENCONTRO'].push(ParticipacaoEncontro.new(i))
		end
		@elementos['PARTICIPACAO-EM-EXPOSICAO'] = Array.new
		arg.elements.each('PARTICIPACAO-EM-EXPOSICAO') do | i |
			@elementos['PARTICIPACAO-EM-EXPOSICAO'].push(ParticipacaoExposicao.new(i))
		end
		@elementos['PARTICIPACAO-EM-OLIMPIADA'] = Array.new
		arg.elements.each('PARTICIPACAO-EM-OLIMPIADA') do | i |
			@elementos['PARTICIPACAO-EM-OLIMPIADA'].push(ParticipacaoOlimpiada.new(i))
		end
		@elementos['OUTRAS-PARTICIPACOES-EM-EVENTOS-CONGRESSOS'] = Array.new
		arg.elements.each('OUTRAS-PARTICIPACOES-EM-EVENTOS-CONGRESSOS') do | i |
			@elementos['OUTRAS-PARTICIPACOES-EM-EVENTOS-CONGRESSOS'].push(OutrasParticipacoesEventosCongressos.new(i))
		end
	end


end


class ParticipanteEventosCongressos

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-COMPLETO-DO-PARTICIPANTE-DE-EVENTOS-CONGRESSOS'] = arg.attributes['NOME-COMPLETO-DO-PARTICIPANTE-DE-EVENTOS-CONGRESSOS']
		@atributos['NOME-PARA-CITACAO-DO-PARTICIPANTE-DE-EVENTOS-CONGRESSOS'] = arg.attributes['NOME-PARA-CITACAO-DO-PARTICIPANTE-DE-EVENTOS-CONGRESSOS']
		@atributos['ORDEM-PARTICIPANTE'] = arg.attributes['ORDEM-PARTICIPANTE']
		@atributos['CPF-DO-PARTICIPANTE-PARTICIPANTE-DE-EVENTOS-CONGRESSOS'] = arg.attributes['CPF-DO-PARTICIPANTE-PARTICIPANTE-DE-EVENTOS-CONGRESSOS']
		@atributos['NRO-ID-CNPQ'] = arg.attributes['NRO-ID-CNPQ']

		@elementos = Hash.new
	end


end


class ParticipacaoCongresso

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-PARTICIPACAO-EM-CONGRESSO'] = DadosBasicosParticipacaoCongresso.new(arg.elements['DADOS-BASICOS-DA-PARTICIPACAO-EM-CONGRESSO'])
		@elementos['DETALHAMENTO-DA-PARTICIPACAO-EM-CONGRESSO'] = DetalhamentoParticipacaoCongresso.new(arg.elements['DETALHAMENTO-DA-PARTICIPACAO-EM-CONGRESSO'])
		@elementos['PARTICIPANTE-DE-EVENTOS-CONGRESSOS'] = Array.new
		arg.elements.each('PARTICIPANTE-DE-EVENTOS-CONGRESSOS') do | i |
			@elementos['PARTICIPANTE-DE-EVENTOS-CONGRESSOS'].push(ParticipanteEventosCongressos.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosParticipacaoCongresso

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['TIPO-PARTICIPACAO'] = arg.attributes['TIPO-PARTICIPACAO']
		@atributos['FORMA-PARTICIPACAO'] = arg.attributes['FORMA-PARTICIPACAO']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoParticipacaoCongresso

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-EVENTO'] = arg.attributes['NOME-DO-EVENTO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['LOCAL-DO-EVENTO'] = arg.attributes['LOCAL-DO-EVENTO']
		@atributos['CIDADE-DO-EVENTO'] = arg.attributes['CIDADE-DO-EVENTO']
		@atributos['NOME-DO-EVENTO-INGLES'] = arg.attributes['NOME-DO-EVENTO-INGLES']

		@elementos = Hash.new
	end


end


class ParticipacaoFeira

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-PARTICIPACAO-EM-FEIRA'] = DadosBasicosParticipacaoFeira.new(arg.elements['DADOS-BASICOS-DA-PARTICIPACAO-EM-FEIRA'])
		@elementos['DETALHAMENTO-DA-PARTICIPACAO-EM-FEIRA'] = DetalhamentoParticipacaoFeira.new(arg.elements['DETALHAMENTO-DA-PARTICIPACAO-EM-FEIRA'])
		@elementos['PARTICIPANTE-DE-EVENTOS-CONGRESSOS'] = Array.new
		arg.elements.each('PARTICIPANTE-DE-EVENTOS-CONGRESSOS') do | i |
			@elementos['PARTICIPANTE-DE-EVENTOS-CONGRESSOS'].push(ParticipanteEventosCongressos.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosParticipacaoFeira

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['TIPO-PARTICIPACAO'] = arg.attributes['TIPO-PARTICIPACAO']
		@atributos['FORMA-PARTICIPACAO'] = arg.attributes['FORMA-PARTICIPACAO']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoParticipacaoFeira

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-EVENTO'] = arg.attributes['NOME-DO-EVENTO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['LOCAL-DO-EVENTO'] = arg.attributes['LOCAL-DO-EVENTO']
		@atributos['CIDADE-DO-EVENTO'] = arg.attributes['CIDADE-DO-EVENTO']
		@atributos['NOME-DO-EVENTO-INGLES'] = arg.attributes['NOME-DO-EVENTO-INGLES']

		@elementos = Hash.new
	end


end


class ParticipacaoSeminario

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-PARTICIPACAO-EM-SEMINARIO'] = DadosBasicosParticipacaoSeminario.new(arg.elements['DADOS-BASICOS-DA-PARTICIPACAO-EM-SEMINARIO'])
		@elementos['DETALHAMENTO-DA-PARTICIPACAO-EM-SEMINARIO'] = DetalhamentoParticipacaoSeminario.new(arg.elements['DETALHAMENTO-DA-PARTICIPACAO-EM-SEMINARIO'])
		@elementos['PARTICIPANTE-DE-EVENTOS-CONGRESSOS'] = Array.new
		arg.elements.each('PARTICIPANTE-DE-EVENTOS-CONGRESSOS') do | i |
			@elementos['PARTICIPANTE-DE-EVENTOS-CONGRESSOS'].push(ParticipanteEventosCongressos.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosParticipacaoSeminario

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['TIPO-PARTICIPACAO'] = arg.attributes['TIPO-PARTICIPACAO']
		@atributos['FORMA-PARTICIPACAO'] = arg.attributes['FORMA-PARTICIPACAO']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoParticipacaoSeminario

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-EVENTO'] = arg.attributes['NOME-DO-EVENTO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['LOCAL-DO-EVENTO'] = arg.attributes['LOCAL-DO-EVENTO']
		@atributos['CIDADE-DO-EVENTO'] = arg.attributes['CIDADE-DO-EVENTO']
		@atributos['NOME-DO-EVENTO-INGLES'] = arg.attributes['NOME-DO-EVENTO-INGLES']

		@elementos = Hash.new
	end


end


class ParticipacaoSimposio

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-PARTICIPACAO-EM-SIMPOSIO'] = DadosBasicosParticipacaoSimposio.new(arg.elements['DADOS-BASICOS-DA-PARTICIPACAO-EM-SIMPOSIO'])
		@elementos['DETALHAMENTO-DA-PARTICIPACAO-EM-SIMPOSIO'] = DetalhamentoParticipacaoSimposio.new(arg.elements['DETALHAMENTO-DA-PARTICIPACAO-EM-SIMPOSIO'])
		@elementos['PARTICIPANTE-DE-EVENTOS-CONGRESSOS'] = Array.new
		arg.elements.each('PARTICIPANTE-DE-EVENTOS-CONGRESSOS') do | i |
			@elementos['PARTICIPANTE-DE-EVENTOS-CONGRESSOS'].push(ParticipanteEventosCongressos.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosParticipacaoSimposio

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['TIPO-PARTICIPACAO'] = arg.attributes['TIPO-PARTICIPACAO']
		@atributos['FORMA-PARTICIPACAO'] = arg.attributes['FORMA-PARTICIPACAO']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoParticipacaoSimposio

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-EVENTO'] = arg.attributes['NOME-DO-EVENTO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['LOCAL-DO-EVENTO'] = arg.attributes['LOCAL-DO-EVENTO']
		@atributos['CIDADE-DO-EVENTO'] = arg.attributes['CIDADE-DO-EVENTO']
		@atributos['NOME-DO-EVENTO-INGLES'] = arg.attributes['NOME-DO-EVENTO-INGLES']

		@elementos = Hash.new
	end


end


class ParticipacaoOficina

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-PARTICIPACAO-EM-OFICINA'] = DadosBasicosParticipacaoOficina.new(arg.elements['DADOS-BASICOS-DA-PARTICIPACAO-EM-OFICINA'])
		@elementos['DETALHAMENTO-DA-PARTICIPACAO-EM-OFICINA'] = DetalhamentoParticipacaoOficina.new(arg.elements['DETALHAMENTO-DA-PARTICIPACAO-EM-OFICINA'])
		@elementos['PARTICIPANTE-DE-EVENTOS-CONGRESSOS'] = Array.new
		arg.elements.each('PARTICIPANTE-DE-EVENTOS-CONGRESSOS') do | i |
			@elementos['PARTICIPANTE-DE-EVENTOS-CONGRESSOS'].push(ParticipanteEventosCongressos.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosParticipacaoOficina

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['TIPO-PARTICIPACAO'] = arg.attributes['TIPO-PARTICIPACAO']
		@atributos['FORMA-PARTICIPACAO'] = arg.attributes['FORMA-PARTICIPACAO']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoParticipacaoOficina

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-EVENTO'] = arg.attributes['NOME-DO-EVENTO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['LOCAL-DO-EVENTO'] = arg.attributes['LOCAL-DO-EVENTO']
		@atributos['CIDADE-DO-EVENTO'] = arg.attributes['CIDADE-DO-EVENTO']
		@atributos['NOME-DO-EVENTO-INGLES'] = arg.attributes['NOME-DO-EVENTO-INGLES']

		@elementos = Hash.new
	end


end


class ParticipacaoEncontro

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-PARTICIPACAO-EM-ENCONTRO'] = DadosBasicosParticipacaoEncontro.new(arg.elements['DADOS-BASICOS-DA-PARTICIPACAO-EM-ENCONTRO'])
		@elementos['DETALHAMENTO-DA-PARTICIPACAO-EM-ENCONTRO'] = DetalhamentoParticipacaoEncontro.new(arg.elements['DETALHAMENTO-DA-PARTICIPACAO-EM-ENCONTRO'])
		@elementos['PARTICIPANTE-DE-EVENTOS-CONGRESSOS'] = Array.new
		arg.elements.each('PARTICIPANTE-DE-EVENTOS-CONGRESSOS') do | i |
			@elementos['PARTICIPANTE-DE-EVENTOS-CONGRESSOS'].push(ParticipanteEventosCongressos.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosParticipacaoEncontro

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['TIPO-PARTICIPACAO'] = arg.attributes['TIPO-PARTICIPACAO']
		@atributos['FORMA-PARTICIPACAO'] = arg.attributes['FORMA-PARTICIPACAO']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoParticipacaoEncontro

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-EVENTO'] = arg.attributes['NOME-DO-EVENTO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['LOCAL-DO-EVENTO'] = arg.attributes['LOCAL-DO-EVENTO']
		@atributos['CIDADE-DO-EVENTO'] = arg.attributes['CIDADE-DO-EVENTO']
		@atributos['NOME-DO-EVENTO-INGLES'] = arg.attributes['NOME-DO-EVENTO-INGLES']

		@elementos = Hash.new
	end


end


class ParticipacaoExposicao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-PARTICIPACAO-EM-EXPOSICAO'] = DadosBasicosParticipacaoExposicao.new(arg.elements['DADOS-BASICOS-DA-PARTICIPACAO-EM-EXPOSICAO'])
		@elementos['DETALHAMENTO-DA-PARTICIPACAO-EM-EXPOSICAO'] = DetalhamentoParticipacaoExposicao.new(arg.elements['DETALHAMENTO-DA-PARTICIPACAO-EM-EXPOSICAO'])
		@elementos['PARTICIPANTE-DE-EVENTOS-CONGRESSOS'] = Array.new
		arg.elements.each('PARTICIPANTE-DE-EVENTOS-CONGRESSOS') do | i |
			@elementos['PARTICIPANTE-DE-EVENTOS-CONGRESSOS'].push(ParticipanteEventosCongressos.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosParticipacaoExposicao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['TIPO-PARTICIPACAO'] = arg.attributes['TIPO-PARTICIPACAO']
		@atributos['FORMA-PARTICIPACAO'] = arg.attributes['FORMA-PARTICIPACAO']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoParticipacaoExposicao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-EVENTO'] = arg.attributes['NOME-DO-EVENTO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['LOCAL-DO-EVENTO'] = arg.attributes['LOCAL-DO-EVENTO']
		@atributos['CIDADE-DO-EVENTO'] = arg.attributes['CIDADE-DO-EVENTO']
		@atributos['NOME-DO-EVENTO-INGLES'] = arg.attributes['NOME-DO-EVENTO-INGLES']

		@elementos = Hash.new
	end


end


class ParticipacaoOlimpiada

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-PARTICIPACAO-EM-OLIMPIADA'] = DadosBasicosParticipacaoOlimpiada.new(arg.elements['DADOS-BASICOS-DA-PARTICIPACAO-EM-OLIMPIADA'])
		@elementos['DETALHAMENTO-DA-PARTICIPACAO-EM-OLIMPIADA'] = DetalhamentoParticipacaoOlimpiada.new(arg.elements['DETALHAMENTO-DA-PARTICIPACAO-EM-OLIMPIADA'])
		@elementos['PARTICIPANTE-DE-EVENTOS-CONGRESSOS'] = Array.new
		arg.elements.each('PARTICIPANTE-DE-EVENTOS-CONGRESSOS') do | i |
			@elementos['PARTICIPANTE-DE-EVENTOS-CONGRESSOS'].push(ParticipanteEventosCongressos.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosParticipacaoOlimpiada

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['TIPO-PARTICIPACAO'] = arg.attributes['TIPO-PARTICIPACAO']
		@atributos['FORMA-PARTICIPACAO'] = arg.attributes['FORMA-PARTICIPACAO']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoParticipacaoOlimpiada

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-EVENTO'] = arg.attributes['NOME-DO-EVENTO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['LOCAL-DO-EVENTO'] = arg.attributes['LOCAL-DO-EVENTO']
		@atributos['CIDADE-DO-EVENTO'] = arg.attributes['CIDADE-DO-EVENTO']
		@atributos['NOME-DO-EVENTO-INGLES'] = arg.attributes['NOME-DO-EVENTO-INGLES']

		@elementos = Hash.new
	end


end


class OutrasParticipacoesEventosCongressos

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-OUTRAS-PARTICIPACOES-EM-EVENTOS-CONGRESSOS'] = DadosBasicosOutrasParticipacoesEventosCongressos.new(arg.elements['DADOS-BASICOS-DE-OUTRAS-PARTICIPACOES-EM-EVENTOS-CONGRESSOS'])
		@elementos['DETALHAMENTO-DE-OUTRAS-PARTICIPACOES-EM-EVENTOS-CONGRESSOS'] = DetalhamentoOutrasParticipacoesEventosCongressos.new(arg.elements['DETALHAMENTO-DE-OUTRAS-PARTICIPACOES-EM-EVENTOS-CONGRESSOS'])
		@elementos['PARTICIPANTE-DE-EVENTOS-CONGRESSOS'] = Array.new
		arg.elements.each('PARTICIPANTE-DE-EVENTOS-CONGRESSOS') do | i |
			@elementos['PARTICIPANTE-DE-EVENTOS-CONGRESSOS'].push(ParticipanteEventosCongressos.new(i))
		end
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosOutrasParticipacoesEventosCongressos

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO'] = arg.attributes['TITULO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['MEIO-DE-DIVULGACAO'] = arg.attributes['MEIO-DE-DIVULGACAO']
		@atributos['HOME-PAGE-DO-TRABALHO'] = arg.attributes['HOME-PAGE-DO-TRABALHO']
		@atributos['FLAG-RELEVANCIA'] = arg.attributes['FLAG-RELEVANCIA']
		@atributos['TIPO-PARTICIPACAO'] = arg.attributes['TIPO-PARTICIPACAO']
		@atributos['FORMA-PARTICIPACAO'] = arg.attributes['FORMA-PARTICIPACAO']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-INGLES'] = arg.attributes['TITULO-INGLES']
		@atributos['FLAG-DIVULGACAO-CIENTIFICA'] = arg.attributes['FLAG-DIVULGACAO-CIENTIFICA']

		@elementos = Hash.new
	end


end


class DetalhamentoOutrasParticipacoesEventosCongressos

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-EVENTO'] = arg.attributes['NOME-DO-EVENTO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['LOCAL-DO-EVENTO'] = arg.attributes['LOCAL-DO-EVENTO']
		@atributos['CIDADE-DO-EVENTO'] = arg.attributes['CIDADE-DO-EVENTO']
		@atributos['NOME-DO-EVENTO-INGLES'] = arg.attributes['NOME-DO-EVENTO-INGLES']

		@elementos = Hash.new
	end


end


class OrientacoesAndamento

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['ORIENTACAO-EM-ANDAMENTO-DE-MESTRADO'] = Array.new
		arg.elements.each('ORIENTACAO-EM-ANDAMENTO-DE-MESTRADO') do | i |
			@elementos['ORIENTACAO-EM-ANDAMENTO-DE-MESTRADO'].push(OrientacaoAndamentoMestrado.new(i))
		end
		@elementos['ORIENTACAO-EM-ANDAMENTO-DE-DOUTORADO'] = Array.new
		arg.elements.each('ORIENTACAO-EM-ANDAMENTO-DE-DOUTORADO') do | i |
			@elementos['ORIENTACAO-EM-ANDAMENTO-DE-DOUTORADO'].push(OrientacaoAndamentoDoutorado.new(i))
		end
		@elementos['ORIENTACAO-EM-ANDAMENTO-DE-POS-DOUTORADO'] = Array.new
		arg.elements.each('ORIENTACAO-EM-ANDAMENTO-DE-POS-DOUTORADO') do | i |
			@elementos['ORIENTACAO-EM-ANDAMENTO-DE-POS-DOUTORADO'].push(OrientacaoAndamentoPosDoutorado.new(i))
		end
		@elementos['ORIENTACAO-EM-ANDAMENTO-DE-APERFEICOAMENTO-ESPECIALIZACAO'] = Array.new
		arg.elements.each('ORIENTACAO-EM-ANDAMENTO-DE-APERFEICOAMENTO-ESPECIALIZACAO') do | i |
			@elementos['ORIENTACAO-EM-ANDAMENTO-DE-APERFEICOAMENTO-ESPECIALIZACAO'].push(OrientacaoAndamentoAperfeicoamentoEspecializacao.new(i))
		end
		@elementos['ORIENTACAO-EM-ANDAMENTO-DE-GRADUACAO'] = Array.new
		arg.elements.each('ORIENTACAO-EM-ANDAMENTO-DE-GRADUACAO') do | i |
			@elementos['ORIENTACAO-EM-ANDAMENTO-DE-GRADUACAO'].push(OrientacaoAndamentoGraduacao.new(i))
		end
		@elementos['ORIENTACAO-EM-ANDAMENTO-DE-INICIACAO-CIENTIFICA'] = Array.new
		arg.elements.each('ORIENTACAO-EM-ANDAMENTO-DE-INICIACAO-CIENTIFICA') do | i |
			@elementos['ORIENTACAO-EM-ANDAMENTO-DE-INICIACAO-CIENTIFICA'].push(OrientacaoAndamentoIniciacaoCientifica.new(i))
		end
		@elementos['OUTRAS-ORIENTACOES-EM-ANDAMENTO'] = Array.new
		arg.elements.each('OUTRAS-ORIENTACOES-EM-ANDAMENTO') do | i |
			@elementos['OUTRAS-ORIENTACOES-EM-ANDAMENTO'].push(OutrasOrientacoesAndamento.new(i))
		end
	end


end


class OrientacaoAndamentoMestrado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-ORIENTACAO-EM-ANDAMENTO-DE-MESTRADO'] = DadosBasicosOrientacaoAndamentoMestrado.new(arg.elements['DADOS-BASICOS-DA-ORIENTACAO-EM-ANDAMENTO-DE-MESTRADO'])
		@elementos['DETALHAMENTO-DA-ORIENTACAO-EM-ANDAMENTO-DE-MESTRADO'] = DetalhamentoOrientacaoAndamentoMestrado.new(arg.elements['DETALHAMENTO-DA-ORIENTACAO-EM-ANDAMENTO-DE-MESTRADO'])
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosOrientacaoAndamentoMestrado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TIPO'] = arg.attributes['TIPO']
		@atributos['TITULO-DO-TRABALHO'] = arg.attributes['TITULO-DO-TRABALHO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-DO-TRABALHO-INGLES'] = arg.attributes['TITULO-DO-TRABALHO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoOrientacaoAndamentoMestrado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TIPO-DE-ORIENTACAO'] = arg.attributes['TIPO-DE-ORIENTACAO']
		@atributos['NOME-DO-ORIENTANDO'] = arg.attributes['NOME-DO-ORIENTANDO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-DA-AGENCIA'] = arg.attributes['NOME-DA-AGENCIA']
		@atributos['NUMERO-ID-ORIENTADO'] = arg.attributes['NUMERO-ID-ORIENTADO']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class OrientacaoAndamentoDoutorado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-ORIENTACAO-EM-ANDAMENTO-DE-DOUTORADO'] = DadosBasicosOrientacaoAndamentoDoutorado.new(arg.elements['DADOS-BASICOS-DA-ORIENTACAO-EM-ANDAMENTO-DE-DOUTORADO'])
		@elementos['DETALHAMENTO-DA-ORIENTACAO-EM-ANDAMENTO-DE-DOUTORADO'] = DetalhamentoOrientacaoAndamentoDoutorado.new(arg.elements['DETALHAMENTO-DA-ORIENTACAO-EM-ANDAMENTO-DE-DOUTORADO'])
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosOrientacaoAndamentoDoutorado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO-DO-TRABALHO'] = arg.attributes['TITULO-DO-TRABALHO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-DO-TRABALHO-INGLES'] = arg.attributes['TITULO-DO-TRABALHO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoOrientacaoAndamentoDoutorado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TIPO-DE-ORIENTACAO'] = arg.attributes['TIPO-DE-ORIENTACAO']
		@atributos['NOME-DO-ORIENTANDO'] = arg.attributes['NOME-DO-ORIENTANDO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-DA-AGENCIA'] = arg.attributes['NOME-DA-AGENCIA']
		@atributos['NUMERO-ID-ORIENTANDO'] = arg.attributes['NUMERO-ID-ORIENTANDO']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class OrientacaoAndamentoPosDoutorado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-ORIENTACAO-EM-ANDAMENTO-DE-POS-DOUTORADO'] = DadosBasicosOrientacaoAndamentoPosDoutorado.new(arg.elements['DADOS-BASICOS-DA-ORIENTACAO-EM-ANDAMENTO-DE-POS-DOUTORADO'])
		@elementos['DETALHAMENTO-DA-ORIENTACAO-EM-ANDAMENTO-DE-POS-DOUTORADO'] = DetalhamentoOrientacaoAndamentoPosDoutorado.new(arg.elements['DETALHAMENTO-DA-ORIENTACAO-EM-ANDAMENTO-DE-POS-DOUTORADO'])
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosOrientacaoAndamentoPosDoutorado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO-DO-TRABALHO'] = arg.attributes['TITULO-DO-TRABALHO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-DO-TRABALHO-INGLES'] = arg.attributes['TITULO-DO-TRABALHO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoOrientacaoAndamentoPosDoutorado

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['TIPO-DE-ORIENTACAO'] = arg.attributes['TIPO-DE-ORIENTACAO']
		@atributos['NOME-DO-ORIENTANDO'] = arg.attributes['NOME-DO-ORIENTANDO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-DA-AGENCIA'] = arg.attributes['NOME-DA-AGENCIA']
		@atributos['NUMERO-ID-ORIENTANDO'] = arg.attributes['NUMERO-ID-ORIENTANDO']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class OrientacaoAndamentoAperfeicoamentoEspecializacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-ORIENTACAO-EM-ANDAMENTO-DE-APERFEICOAMENTO-ESPECIALIZACAO'] = DadosBasicosOrientacaoAndamentoAperfeicoamentoEspecializacao.new(arg.elements['DADOS-BASICOS-DA-ORIENTACAO-EM-ANDAMENTO-DE-APERFEICOAMENTO-ESPECIALIZACAO'])
		@elementos['DETALHAMENTO-DA-ORIENTACAO-EM-ANDAMENTO-DE-APERFEICOAMENTO-ESPECIALIZACAO'] = DetalhamentoOrientacaoAndamentoAperfeicoamentoEspecializacao.new(arg.elements['DETALHAMENTO-DA-ORIENTACAO-EM-ANDAMENTO-DE-APERFEICOAMENTO-ESPECIALIZACAO'])
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosOrientacaoAndamentoAperfeicoamentoEspecializacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO-DO-TRABALHO'] = arg.attributes['TITULO-DO-TRABALHO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-DO-TRABALHO-INGLES'] = arg.attributes['TITULO-DO-TRABALHO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoOrientacaoAndamentoAperfeicoamentoEspecializacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-ORIENTANDO'] = arg.attributes['NOME-DO-ORIENTANDO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-DA-AGENCIA'] = arg.attributes['NOME-DA-AGENCIA']
		@atributos['NUMERO-ID-ORIENTANDO'] = arg.attributes['NUMERO-ID-ORIENTANDO']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class OrientacaoAndamentoGraduacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-ORIENTACAO-EM-ANDAMENTO-DE-GRADUACAO'] = DadosBasicosOrientacaoAndamentoGraduacao.new(arg.elements['DADOS-BASICOS-DA-ORIENTACAO-EM-ANDAMENTO-DE-GRADUACAO'])
		@elementos['DETALHAMENTO-DA-ORIENTACAO-EM-ANDAMENTO-DE-GRADUACAO'] = DetalhamentoOrientacaoAndamentoGraduacao.new(arg.elements['DETALHAMENTO-DA-ORIENTACAO-EM-ANDAMENTO-DE-GRADUACAO'])
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosOrientacaoAndamentoGraduacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO-DO-TRABALHO'] = arg.attributes['TITULO-DO-TRABALHO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-DO-TRABALHO-INGLES'] = arg.attributes['TITULO-DO-TRABALHO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoOrientacaoAndamentoGraduacao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-ORIENTANDO'] = arg.attributes['NOME-DO-ORIENTANDO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-DA-AGENCIA'] = arg.attributes['NOME-DA-AGENCIA']
		@atributos['NUMERO-ID-ORIENTANDO'] = arg.attributes['NUMERO-ID-ORIENTANDO']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class OrientacaoAndamentoIniciacaoCientifica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DA-ORIENTACAO-EM-ANDAMENTO-DE-INICIACAO-CIENTIFICA'] = DadosBasicosOrientacaoAndamentoIniciacaoCientifica.new(arg.elements['DADOS-BASICOS-DA-ORIENTACAO-EM-ANDAMENTO-DE-INICIACAO-CIENTIFICA'])
		@elementos['DETALHAMENTO-DA-ORIENTACAO-EM-ANDAMENTO-DE-INICIACAO-CIENTIFICA'] = DetalhamentoOrientacaoAndamentoIniciacaoCientifica.new(arg.elements['DETALHAMENTO-DA-ORIENTACAO-EM-ANDAMENTO-DE-INICIACAO-CIENTIFICA'])
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosOrientacaoAndamentoIniciacaoCientifica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO-DO-TRABALHO'] = arg.attributes['TITULO-DO-TRABALHO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-DO-TRABALHO-INGLES'] = arg.attributes['TITULO-DO-TRABALHO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoOrientacaoAndamentoIniciacaoCientifica

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-ORIENTANDO'] = arg.attributes['NOME-DO-ORIENTANDO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-DA-AGENCIA'] = arg.attributes['NOME-DA-AGENCIA']
		@atributos['NUMERO-ID-ORIENTANDO'] = arg.attributes['NUMERO-ID-ORIENTANDO']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class OutrasOrientacoesAndamento

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['SEQUENCIA-PRODUCAO'] = arg.attributes['SEQUENCIA-PRODUCAO']

		@elementos = Hash.new
		@elementos['DADOS-BASICOS-DE-OUTRAS-ORIENTACOES-EM-ANDAMENTO'] = DadosBasicosOutrasOrientacoesAndamento.new(arg.elements['DADOS-BASICOS-DE-OUTRAS-ORIENTACOES-EM-ANDAMENTO'])
		@elementos['DETALHAMENTO-DE-OUTRAS-ORIENTACOES-EM-ANDAMENTO'] = DetalhamentoOutrasOrientacoesAndamento.new(arg.elements['DETALHAMENTO-DE-OUTRAS-ORIENTACOES-EM-ANDAMENTO'])
		@elementos['PALAVRAS-CHAVE'] = PalavrasChave.new(arg.elements['PALAVRAS-CHAVE'])
		@elementos['AREAS-DO-CONHECIMENTO'] = AreasConhecimento.new(arg.elements['AREAS-DO-CONHECIMENTO'])
		@elementos['SETORES-DE-ATIVIDADE'] = SetoresAtividade.new(arg.elements['SETORES-DE-ATIVIDADE'])
		@elementos['INFORMACOES-ADICIONAIS'] = InformacoesAdicionais.new(arg.elements['INFORMACOES-ADICIONAIS'])
	end


end


class DadosBasicosOutrasOrientacoesAndamento

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NATUREZA'] = arg.attributes['NATUREZA']
		@atributos['TITULO-DO-TRABALHO'] = arg.attributes['TITULO-DO-TRABALHO']
		@atributos['ANO'] = arg.attributes['ANO']
		@atributos['PAIS'] = arg.attributes['PAIS']
		@atributos['IDIOMA'] = arg.attributes['IDIOMA']
		@atributos['HOME-PAGE'] = arg.attributes['HOME-PAGE']
		@atributos['DOI'] = arg.attributes['DOI']
		@atributos['TITULO-DO-TRABALHO-INGLES'] = arg.attributes['TITULO-DO-TRABALHO-INGLES']

		@elementos = Hash.new
	end


end


class DetalhamentoOutrasOrientacoesAndamento

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['NOME-DO-ORIENTANDO'] = arg.attributes['NOME-DO-ORIENTANDO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['NOME-CURSO'] = arg.attributes['NOME-CURSO']
		@atributos['FLAG-BOLSA'] = arg.attributes['FLAG-BOLSA']
		@atributos['CODIGO-AGENCIA-FINANCIADORA'] = arg.attributes['CODIGO-AGENCIA-FINANCIADORA']
		@atributos['NOME-DA-AGENCIA'] = arg.attributes['NOME-DA-AGENCIA']
		@atributos['NUMERO-ID-ORIENTANDO'] = arg.attributes['NUMERO-ID-ORIENTANDO']
		@atributos['NOME-CURSO-INGLES'] = arg.attributes['NOME-CURSO-INGLES']

		@elementos = Hash.new
	end


end


class InformacoesAdicionaisInstituicoes

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['INFORMACAO-ADICIONAL-INSTITUICAO'] = Array.new
		arg.elements.each('INFORMACAO-ADICIONAL-INSTITUICAO') do | i |
			@elementos['INFORMACAO-ADICIONAL-INSTITUICAO'].push(InformacaoAdicionalInstituicao.new(i))
		end
	end


end


class InformacaoAdicionalInstituicao

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['SIGLA-INSTITUICAO'] = arg.attributes['SIGLA-INSTITUICAO']
		@atributos['SIGLA-UF-INSTITUICAO'] = arg.attributes['SIGLA-UF-INSTITUICAO']
		@atributos['SIGLA-PAIS-INSTITUICAO'] = arg.attributes['SIGLA-PAIS-INSTITUICAO']
		@atributos['NOME-PAIS-INSTITUICAO'] = arg.attributes['NOME-PAIS-INSTITUICAO']
		@atributos['FLAG-AGENCIA-FOMENTO'] = arg.attributes['FLAG-AGENCIA-FOMENTO']
		@atributos['FLAG-INSTITUICAO-DE-ENSINO'] = arg.attributes['FLAG-INSTITUICAO-DE-ENSINO']

		@elementos = Hash.new
	end


end


class InformacoesAdicionaisCursos

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new

		@elementos = Hash.new
		@elementos['INFORMACAO-ADICIONAL-CURSO'] = Array.new
		arg.elements.each('INFORMACAO-ADICIONAL-CURSO') do | i |
			@elementos['INFORMACAO-ADICIONAL-CURSO'].push(InformacaoAdicionalCurso.new(i))
		end
	end


end


class InformacaoAdicionalCurso

	def initialize(arg)

		return if arg == nil

		@atributos = Hash.new
		@atributos['CODIGO-CURSO'] = arg.attributes['CODIGO-CURSO']
		@atributos['CODIGO-ORGAO'] = arg.attributes['CODIGO-ORGAO']
		@atributos['NOME-ORGAO'] = arg.attributes['NOME-ORGAO']
		@atributos['CODIGO-INSTITUICAO'] = arg.attributes['CODIGO-INSTITUICAO']
		@atributos['NOME-INSTITUICAO'] = arg.attributes['NOME-INSTITUICAO']
		@atributos['NOME-GRANDE-AREA-DO-CONHECIMENTO'] = arg.attributes['NOME-GRANDE-AREA-DO-CONHECIMENTO']
		@atributos['NOME-DA-AREA-DO-CONHECIMENTO'] = arg.attributes['NOME-DA-AREA-DO-CONHECIMENTO']
		@atributos['NOME-DA-SUB-AREA-DO-CONHECIMENTO'] = arg.attributes['NOME-DA-SUB-AREA-DO-CONHECIMENTO']
		@atributos['NOME-DA-ESPECIALIDADE'] = arg.attributes['NOME-DA-ESPECIALIDADE']
		@atributos['NIVEL-CURSO'] = arg.attributes['NIVEL-CURSO']

		@elementos = Hash.new
	end


end



if __FILE__ == $0
	xml_filename = 'cv_lattes.xml'
#	xml_filename = ARGV[0]

	xml_file = REXML::Document.new File.new(xml_filename)
	obj_loader = CurriculoVitae.new(xml_file.elements['CURRICULO-VITAE'])
	obj_loader.parse
end
