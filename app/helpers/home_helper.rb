module HomeHelper
	def render_address(address)
		return unless address.present?

		content_tag(:div, class: 'mt-4 p-4 border rounded bg-gray-100') do
		content_tag(:h2, 'Endereço pesquisado:', class: 'text-xl font-bold') +
		content_tag(:p, "<strong>CEP:</strong> #{address[:cep]}".html_safe) +
		content_tag(:p, "<strong>Logradouro:</strong> #{address[:address]}".html_safe) +
		content_tag(:p, "<strong>Bairro:</strong> #{address[:district]}".html_safe) +
		content_tag(:p, "<strong>Cidade:</strong> #{address[:city]}".html_safe) +
		content_tag(:p, "<strong>Estado:</strong> #{address[:state]}".html_safe) +
		content_tag(:p, "<strong>DDD:</strong> #{address[:ddd]}".html_safe)
		end
	end
end
