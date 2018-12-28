class DTD
	def initialize(d)
		# Listagem 5.9: Busca de Elementos
		@elements = Array.new
		d.scan(RE_ELEMENT) { | m | @elements.push(Element.new(m, d)) }
		# Listagem 5.9 - FINAL

		@map = Hash.new

 		@map['CURRICULO-VITAE'] = <<EOF
		def XML2TeX(cv_filename)
			tmp = @atributos['DATA-ATUALIZACAO']

			# insere separadores e converte data para o formato padrão do pacote datetime2
			data = tmp[4..7] + "-" + tmp[2..3] + "-" + tmp[0..1]

			tmp = @atributos['HORA-ATUALIZACAO']
			hora = tmp[0..1] + ":" + tmp[2..3] + ":" + tmp[4..5]

			file_TeX = IO.read("header.tex")
			file_TeX.gsub! 'NOME-COMPLETO'   , @elementos['DADOS-GERAIS'].atributos['NOME-COMPLETO']
			file_TeX.gsub! 'DATA-ATUALIZACAO', data
			file_TeX.gsub! 'HORA-ATUALIZACAO', hora
			file_TeX.gsub! 'cv_filename', cv_filename
			
			cv_file = File.new(cv_filename, "w")
			cv_file.write(file_TeX)
			cv_file.close
		end
EOF

		# Listagem 5.7: Mapeamento de Métodos para o Currículo Lattes
# 		@map['CURRICULO-VITAE'] = <<EOF
# 		def XML2TeX
# 			puts '\\documentclass[a4paper]{article}'
# 			puts '\\usepackage[brazil]{babel}'
# 			puts '\\usepackage[utf8]{inputenc}'
# 			puts
# 			puts '\\begin{document}'
# 			@elementos['DADOS-GERAIS'].toTEX
# 			puts '\\newpage'
# 			@elementos['PRODUCAO-BIBLIOGRAFICA'].toTEX
# 			puts '\\newpage'
# 			@elementos['DADOS-COMPLEMENTARES'].toTEX
# 			puts '\\end{document}'
# 		end
# EOF
		# Listagem 6.2: Métodos de Geração do Código LATEX: Informações Pessoais e Resumos
		# ...
		@map['DADOS-GERAIS'] = <<EOF
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
EOF
		# Listagem 6.7: Métodos de Geração do Código LATEX: Alternativas de Formatação
# 		@map['DADOS-GERAIS'] = <<EOF
# 		def toTEX
# 			puts '\\section*{Dados Gerais}'
# 			puts @atributos['NOME-COMPLETO'].upcase
# 			puts @atributos['CIDADE-NASCIMENTO']
# 			puts @atributos['PAIS-DE-NASCIMENTO']
# 			@elementos['RESUMO-CV'].toTEX
# 			@elementos['IDIOMAS'].toTEX
# 			@elementos['FORMACAO-ACADEMICA-TITULACAO'].toTEX
# 		end
# EOF
		# Listagem 6.7 - FINAL
		# ...
		# Listagem 6.2 - FINAL
		@map['PRODUCAO-BIBLIOGRAFICA'] = <<EOF
		def toTEX
			puts '\\subsection*{Producao Bibliografica}'
			@elementos['TRABALHOS-EM-EVENTOS'].toTEX
			@elementos['ARTIGOS-PUBLICADOS'].toTEX
			@elementos['LIVROS-E-CAPITULOS'].toTEX
			@elementos['TEXTOS-EM-JORNAIS-OU-REVISTAS'].toTEX
			@elementos['ARTIGOS-ACEITOS-PARA-PUBLICACAO'].toTEX
		end
EOF
		@map['DADOS-COMPLEMENTARES'] = <<EOF
		def toTEX
		end
EOF
		# Listagem 5.7 - FINAL
		# Listagem 6.2: Métodos de Geração do Código LATEX: Informações Pessoais e Resumos
		# ...
		@map['RESUMO-CV'] = <<EOF
		def toTEX
			puts '\\subsection*{Resumo}'
			puts @atributos['TEXTO-RESUMO-CV-RH']
		end
EOF
		# ...
		# Listagem 6.2 - FINAL
		# Listagem 6.9: Validando o Currículo Lattes
		# OBS.: válido apenas para os elementos: ARTIGO-PUBLICADO e ARTIGO-ACEITO-PARA-PUBLICACAO
		@map['DADOS-BASICOS-DO-ARTIGO'] = <<EOF
		def validade
			if @atributos['ANO-DO-ARTIGO'] > Date.new.year
				puts 'Ano Invalido! Artigo: '
				puts @atributos['TITULO-DO-ARTIGO']
				puts ' (' + @atributos['ANO-DO-ARTIGO'] + ')'
			end
		end
EOF
		# Listagem 6.9 - FINAL
	end

	# Listagem 5.11: Método de Geração de Classes no Objeto DTD
	def printClasses(d)
		d = File.new(d, "w")
		d.puts "require 'rexml/document'"
		d.puts "include REXML"
		d.puts
		@elements.each do
		| e | e.printClass(d, @map[e.name])
		d.puts
		d.puts
		end
		d.puts
		d.puts "if __FILE__ == $0"
		d.puts "	xml_filename = 'cv_lattes.xml'"
		d.puts "#	xml_filename = ARGV[0]"
		d.puts
		d.puts "	xml_file = REXML::Document.new File.new(xml_filename)"
		d.puts
		d.puts "	TeX_filename = 'cv_lattes.tex'"
		d.puts "#	TeX_filename = ARGV[1]"
		d.puts
		d.puts "	obj_loader = #{className(@elements[0].name)}.new(xml_file.elements['#{@elements[0].name}'])"
		d.puts "	obj_loader.XML2TeX(TeX_filename)"
		d.puts
		d.puts "	TeX2PDF(TeX_filename)"
		d.puts
		d.puts "end"
		d.close

	end
	# Listagem 5.11 - FINAL

end

class Element
	attr_reader :name
	def initialize(m, d)
		@name = m[0]
		@elements = Hash.new
		str = m[1].split(',').map{|x| x.tr("( )","")}
		last_chr = str.map{|x| x[-1]}
		# last_chr = last_chr.map{ |x| x.tr("QWERTYUIOPASDFGHJKLZXCVBNM", "")} # (10...36).map{ |i| i.to_s 36}.join.upcase
		last_chr = last_chr.map{ |x| x.tr((10...36).map{ |i| i.to_s 36}.join.upcase, "")}
		str = str.map{|x| x.tr("#?*+","")}
		str.each_index{ |idx| @elements.store(str[idx], last_chr[idx]) }

		@elements.delete('EMPTY')
		@elements.delete('PCDATA')
		
		# Listagem 5.10: Busca de Atributos
		@attributes = Array.new
		d.scan(RE_ATTRIBUTE) { | m |
			m[1].scan(RE_ATTRIBUTE_LIST) { | n |
				@attributes.push(Attribute.new(n)) unless n[0] == ''
			} if m[0] == @name
		}
		# Listagem 5.10 - FINAL

	end
	
	# Listagem 5.12: Método de Impressão de Classe no Objeto Element
	def printClass(d, m)
		d.puts "class #{className(@name)}"
		d.puts
		d.puts "attr_reader :atributos"
		d.puts
		d.puts "	def initialize(arg)"
		d.puts
		d.puts "		return if arg == nil"
		d.puts
		d.puts "		@atributos = Hash.new"
		@attributes.each do | a |
			d.puts "		@atributos['#{a.name}'] = arg.attributes['#{a.name}']"
		end
		d.puts
		if @elements.instance_of?(Hash)
			d.puts "		@elementos = Hash.new"
			@elements.each do | c, v |
				if (v == '' or v == '?')
					d.puts "		@elementos['#{c}'] = #{className(c)}.new(arg.elements['#{c}'])"
				else
					d.puts "		@elementos['#{c}'] = Array.new"
					d.puts "		arg.elements.each('#{c}') do | i |"
					d.puts "			@elementos['#{c}'].push(#{className(c)}.new(i))"
					d.puts "		end"
					end
				end
			end
#		d.puts
		d.puts "	end"
		d.puts
		d.puts m unless m == nil
		d.puts
		d.puts "end"
	end
	# Listagem 5.12 - FINAL
end

class Attribute
	attr_reader :name
	def initialize(n)
		@name = n[0]
		@type = n[1]
		@value = n[2]
	end
end

def className(name)
	name = name.split('-')
	name = name - ['DA', 'DE', 'DO', 'EM', 'NA', 'NO', 'OU']
	name.map!(&:capitalize!)
	name.join
end

# if __FILE__ == $0
# 	# Listagem 5.8: Expressões Regulares Utilizadas no Parser de DTD
# 	# [1] = Nome do Elemento [2] = Elementos do Elemento
# 	RE_ELEMENT = /<!ELEMENT\ (.*)\ (EMPTY|ANY|\(.*\))>/
# 	# [1] = Nome do Elemento [2] = Lista de Atributos do Elemento
# 	RE_ATTRIBUTE = /<!ATTLIST\s*(\S*)\s*([^>]*)>/
# 	# [1] = Nome do Atributo [2] = Tipo [3] = Valor
# 	RE_ATTRIBUTE_LIST = /\s*(\S*)\s*(\([^\)]*\)|\S*)\s*(#FIXED\s*\S*|\S*)/
# 	# Listagem 5.8 - FINAL

# 	dtd_filename = "documento.dtd"
# #	dtd_filename = ARGV[0]
# 	dtd_file = File.read(dtd_filename, encoding: 'ISO-8859-1')
# 	parser = DTD.new(dtd_file)
# 	parser.printClasses("CurriculoVitae.rb")
    
# end
