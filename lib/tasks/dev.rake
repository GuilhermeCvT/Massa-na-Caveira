namespace :dev do
  desc "Configurar ambiente no banco"
  task setup: :environment do
    if Rails.env.development?
      show_spinner ("Apagando banco...")                  {%x(rails db:drop)}
      show_spinner ("Criando banco...")                   {%x(rails db:create)}
      show_spinner ("Migrando banco...")                  {%x(rails db:migrate)}
      show_spinner ("Criando empresas...")                {%x(rails dev:add_default_company)}
      show_spinner ("Criando permissões...")              {%x(rails dev:add_default_entrance)}
      show_spinner ("Criando usuários...")                {%x(rails dev:add_default_user)}
      show_spinner ("Criando tipo de perguntas...")       {%x(rails dev:add_default_type_question)}
      show_spinner ("Criando perguntas...")               {%x(rails dev:add_default_question)}
      show_spinner ("Criando respostas determinadas...")  {%x(rails dev:add_default_determined_answers)}
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

  desc "Adicionar tipo de perguntas no banco"
  task add_default_type_question: :environment do
    show_spinner ("Adicionando tipo de perguntas no banco...") do
      type_question = [
        {description: "Aberta"},
        {description: "Determinada"},
        {description: "Nota"}
      ]

      type_question.each do |type_question|
        TypeQuestion.create!(type_question)
      end
    end
  end

  desc "Adicionar perguntas no banco"
  task add_default_question: :environment do
    show_spinner ("Adicionando perguntas no banco...") do
      question = [
        {enable: true, priority: 0, description: "Essa é a primeira pergunta", type_question_id: 1},
        {enable: true, priority: 1, description: "Essa é a segunda pergunta", type_question_id: 2},
        {enable: true, priority: 2, description: "Essa é a terceira pergunta", type_question_id: 3}
      ]

      question.each do |question|
        Question.create!(question)
      end
    end
  end

  desc "Adicionar respostas determinadas no banco"
  task add_default_determined_answers: :environment do
    show_spinner ("Adicionando respostas determinadas no banco...") do
      determined_answers = [
        {description: "Essa é a primeira resposta", question_id: 2},
        {description: "Essa é a segunda resposta", question_id: 2},
        {description: "Essa é a terceira resposta", question_id: 2}
      ]

      determined_answers.each do |determined_answers|
        DeterminedAnswer.create!(determined_answers)
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
