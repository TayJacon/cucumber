# frozen_string_literal: true
Dado('que o produto desejado é {string}') do |produto|
  @produto_nome = produto
end

Dado('o valor do produto é de {string}') do |valor|
  @produto_valor = valor
end

Quando('eu adiciono {int} unidade\\(s)') do |quantidade|
  quantidade.times do
    @rest_page.add_to_cart(@produto_nome)
  end
end

Então('deve ser adicionado {int} unidade\\(s) deste item') do |quantidade|
  expect(@cart_page.box).to have_text "(#{quantidade}x) #{@produto_nome}"
end

Então('o valor total deve ser de {string}') do |valor_total|
  expect(@cart_page.total.text).to eql valor_total
end

# Lista produtos

Dado('que os produtos desejados são:') do |table|
  @product_list = table.hashes
end
  
Quando('eu adiciono todos os itens') do
  @product_list.each do |product|
    product['quantidade'].to_i.times do
      @rest_page.add_to_cart(@product)
    end
  end
end
  
Então('vejo todos os itens no carrinho') do
  @product_list.each do |product|
    expect(@cart_page.box).to have_text "(#{product['quantidade']}x) #{product['nome']}"
  end
end

# Remover items

Dado('que eu tenho os seguintes itens no carrinho:') do |table|
  @product_list = table.hashes
  steps %{
    Quando eu adiciono todos os itens
  }
end

Quando('eu removo somente o item {int}') do |item|
  @cart_page.remove_item(item)
end

Quando('eu removo todos os itens') do
  @product_list.each_with_index do |value, idx|
    @cart_page.remove_item(idx)
  end
end

Quando('eu limpo o meu carrinho') do
  @cart_page.clean
end

Então('vejo a seguinte mensagem no carrinho {string}') do |mensagem|
  expect(@cart_page.box).to have_text mensagem
end
