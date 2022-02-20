namespace :dev do
  desc "Configurar ambiente no banco"
  task setup: :environment do
    if Rails.env.development?
      show_spinner ("Apagando banco...") {%x(rails db:drop)}
      show_spinner ("Criando banco...") {%x(rails db:create)}
      show_spinner ("Migrando banco...") {%x(rails db:migrate)}
      %x(rails dev:add_default_company)
      %x(rails dev:add_default_entrance)
      %x(rails dev:add_default_user)
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Adicionar empresa no banco"
  task add_default_company: :environment do
    show_spinner ("Adicionando empresa no banco...") do
      company = [
        {description: 'Americana/SP', enable: 'True'}
      ]
    
      company.each do |company|
        Company.create!(company)
      end
    end
  end

  desc "Adicionar permissões no banco"
  task add_default_entrance: :environment do
    show_spinner ("Adicionando permissões no banco...") do
      entrance = [
        {description: 'Administrador'},
        {description: 'Gerente'},
        {description: 'Comum'},
        {description: 'Consulta'}
      ]

      entrance.each do |entrance|
        Entrance.create!(entrance)
      end
    end
  end

  desc "Adicionar usuário no banco"
  task add_default_user: :environment do
    show_spinner ("Adicionar usuário padrão no banco...") do
      user = [
        {email: 'admin@admin.com',
        username: 'admin',
        company_id: 1,
        entrance_id: 1,
        enable: 'True',
        password: 123456,
        password_confirmation: 123456}
      ]

      user.each do |user|
        User.create!(user)
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
