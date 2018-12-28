require "./DTD.rb"
require "./CurriculoVitae.rb"

def TeX2PDF(filename, opt)
	opt = opt.downcase

	case opt
	when nil, "arara"
		command = "arara #{filename}"
		exec(command.to_s)
	when "pdflatex"
		command = "pdflatex.exe -synctex=1 -interaction=nonstopmode #{filename}"
		exec(command.to_s)
	else
		puts "ERRO!! Opção #{opt} inválida! Use arara ou  pdflatex.\n"
	end
end

# todo: check if CurriculoVitae.rb already exists

if __FILE__ == $0
	# Listagem 5.8: Expressões Regulares Utilizadas no Parser de DTD
	# [1] = Nome do Elemento [2] = Elementos do Elemento
	RE_ELEMENT = /<!ELEMENT\ (.*)\ (EMPTY|ANY|\(.*\))>/
	# [1] = Nome do Elemento [2] = Lista de Atributos do Elemento
	RE_ATTRIBUTE = /<!ATTLIST\s*(\S*)\s*([^>]*)>/
	# [1] = Nome do Atributo [2] = Tipo [3] = Valor
	RE_ATTRIBUTE_LIST = /\s*(\S*)\s*(\([^\)]*\)|\S*)\s*(#FIXED\s*\S*|\S*)/
	# Listagem 5.8 - FINAL

	# dtd_filename = "documento.dtd"
	dtd_filename = ARGV[0]
	dtd_file = File.read(dtd_filename, encoding: 'ISO-8859-1')
	parser = DTD.new(dtd_file)
    parser.printClasses("CurriculoVitae.rb")
    
    old_file = File.read("CurriculoVitae.rb")
    new_file = File.new("CurriculoVitae.rb", "w")

	# esse é o único jeito que eu encotrei para resolver o problema na definição da classe Idioma.
    old_file.gsub! 'Idiomas', 'Idioma'
    new_file.write(old_file)
    new_file.close

	# reload!('CurriculoVitae.rb')

	# xml_filename = 'cv_lattes.xml'
	xml_filename = ARGV[1]

	xml_file = File.new(xml_filename)
	xml_doc = REXML::Document.new(xml_file)

	# filename_TeX = 'cv_lattes.tex'
	filename_TeX = ARGV[2]

	obj_loader = CurriculoVitae.new(xml_doc.elements['CURRICULO-VITAE'])

	obj_loader.XML2TeX(filename_TeX)

	TeX2PDF(filename_TeX, 'arara')
    
end
