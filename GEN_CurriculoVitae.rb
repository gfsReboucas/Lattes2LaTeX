# Listagem 5.15: Parser de XML Gerado para o Currículo Lattes
require 'rexml/document'
include REXML
class CurriculoVitae
    def initialize( d )
        return if d == nil
        @atributos = Hash.new
        @atributos['SISTEMA-ORIGEM-XML'] = d.attributes['SISTEMA-ORIGEM-XML']

        @elementos = Hash.new
        @elementos['DADOS-GERAIS'] = DadosGerais.new(d.elements['DADOS-GERAIS'])
        @elementos['PRODUCAO-BIBLIOGRAFICA'] = ProducaoBibliografica.new(d.elements['PRODUCAO-BIBLIOGRAFICA'])
        @elementos['PRODUCAO-TECNICA'] = ProducaoTecnica.new(d.elements['PRODUCAO-TECNICA'])
        @elementos['OUTRA-PRODUCAO'] = OutraProducao.new(d.elements['OUTRA-PRODUCAO'])
        @elementos['DADOS-COMPLEMENTARES'] = DadosComplementares.new(d.elements['DADOS-COMPLEMENTARES'])
    end

    # Listagem 5.16: Métodos de Geração de Código no Parser de XML
    # ...
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
    # Listagem 5.16 - FINAL
end

# Listagem 6.3: Estrutura do Parser de XML: Informações Pessoais e Resumos
class DadosGerais
    attr_reader :atributos, :elementos
    def initialize( d )
        return if d == nil
        @atributos = Hash.new
        @atributos['NOME-COMPLETO'] = d.attributes['NOME-COMPLETO']
        @atributos['NOME-EM-CITACOES-BIBLIOGRAFICAS'] = d.attributes['NOME-EM-CITACOES-BIBLIOGRAFICAS']
        @atributos['NACIONALIDADE'] = d.attributes['NACIONALIDADE']
        @atributos['CPF'] = d.attributes['CPF']
        @atributos['NUMERO-DO-PASSAPORTE'] = d.attributes['NUMERO-DO-PASSAPORTE']
        @atributos['PAIS-DE-NASCIMENTO'] = d.attributes['PAIS-DE-NASCIMENTO']
        @atributos['UF-NASCIMENTO'] = d.attributes['UF-NASCIMENTO']
        @atributos['CIDADE-NASCIMENTO'] = d.attributes['CIDADE-NASCIMENTO']
        # ...
        @elementos = Hash.new
        @elementos['ENDERECO'] = Endereco.new(d.elements['ENDERECO'])
        @elementos['RESUMO-CV'] = ResumoCV.new(d.elements['RESUMO-CV'])
        # ...
        # Listagem 6.3 - FINAL
        @elementos['IDIOMAS'] = Idiomas.new(d.elements['IDIOMAS'])
        @elementos['ATUACOES-PROFISSIONAIS'] = AtuacoesProfissionais.new(d.elements['ATUACOES-PROFISSIONAIS'])
        @elementos['AREAS-DE-ATUACAO'] = AreasAtuacao.new(d.elements['AREAS-DE-ATUACAO'])
        @elementos['PREMIOS-TITULOS'] = PremiosTitulos.new(d.elements['PREMIOS-TITULOS'])
        @elementos['FORMACAO-ACADEMICA-TITULACAO'] = FormacaoAcademicaTitulacao.new(d.elements['FORMACAO-ACADEMICA-TITULACAO'])
        @elementos['OUTRAS-INFORMACOES-RELEVANTES'] = OutrasInformacoesRelevantes.new(d.elements['OUTRAS-INFORMACOES-RELEVANTES'])
    end

    # Listagem 5.16: Métodos de Geração de Código no Parser de XML
    # ...
    def toTEX
        puts '\\section*{Curriculum Vitae}'
        puts @atributos['NOME-COMPLETO']
        puts @atributos['CIDADE-NASCIMENTO'] + ', '
        puts @atributos['PAIS-DE-NASCIMENTO']
        puts
        @elementos['RESUMO-CV'].toTEX
        @elementos['IDIOMAS'].toTEX
        @elementos['FORMACAO-ACADEMICA-TITULACAO'].toTEX
    end
    # Listagem 5.16 - FINAL

    # Listagem 6.8: Estrutura do Parser de XML: Alternativas de Formatação
    # def toTEX
    #     puts '\section*{Dados Gerais}'
    #     puts @atributos['NOME-COMPLETO'].upcase
    #     puts @atributos['CIDADE-NASCIMENTO']
    #     puts @atributos['PAIS-DE-NASCIMENTO']
    #     @elementos['RESUMO-CV'].toTEX
    #     @elementos['IDIOMAS'].toTEX
    #     @elementos['FORMACAO-ACADEMICA-TITULACAO'].toTEX
    # end
    # Listagem 6.8 - FINAL

end
# Listagem 5.15 - FINAL

# Listagem 5.16: Métodos de Geração de Código no Parser de XML
class ProducaoBibliografica
    # ...
    def toTEX
        puts '\\subsection*{Producao Bibliografica}'
        @elementos['TRABALHOS-EM-EVENTOS'].toTEX
        @elementos['ARTIGOS-PUBLICADOS'].toTEX
        @elementos['LIVROS-E-CAPITULOS'].toTEX
        @elementos['TEXTOS-EM-JORNAIS-OU-REVISTAS'].toTEX
        @elementos['ARTIGOS-ACEITOS-PARA-PUBLICACAO'].toTEX
    end
end
class DadosComplementares
    #...
    def toTEX
    end
end
# Listagem 5.16 - FINAL

# Listagem 6.3: Estrutura do Parser de XML: Informações Pessoais e Resumos
class ResumoCV
    attr_reader :atributos, :elementos
    def initialize( d )
        return if d == nil
        @atributos = Hash.new
        @atributos['TEXTO-RESUMO-CV-RH'] = d.attributes['TEXTO-RESUMO-CV-RH']
    end
    def toTEX
        puts '\subsection*{Resumo}'
        puts @atributos['TEXTO-RESUMO-CV-RH']
    end
end
# Listagem 6.3 - FINAL

# Listagem 5.14: Geração dos Objetos
f = Document.new(File.new(ARGV[0]))
oLoader = CurriculoVitae.new(f.elements['CURRICULO-VITAE'])
oLoader.parse
# Listagem 5.14 - FINAL
