# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all
User.destroy_all

categories = Category.create!([
                                { title: 'История' },
                                { title: 'Биология' },
                                { title: 'Литература' }
                              ])

users = User.create!([
                       { name: 'Александр', email: 'alexandr@gmail.com', password_digest: '12345' },
                       { name: 'Anonymous', email: 'anjnymous@gmail.com', password_digest: '67890' }
                     ])

tests = Test.create!([
                       { title: 'Онлайн-тесты по истории 5 класс', level: 1,
                         category_id: categories[0].id, author_id: users[0].id },
                       { title: 'Онлайн-тесты по истории 9 класс', level: 2,
                         category_id: categories[0].id, author_id: users[0].id },
                       { title: 'Онлайн-тесты по биологии 5 класс', level: 1,
                         category_id: categories[1].id, author_id: users[0].id },
                       { title: 'Онлайн-тесты по биологии 9 класс', level: 2,
                         category_id: categories[1].id, author_id: users[0].id },
                       { title: 'Онлайн-тесты по литературе 5 класс', level: 1,
                         category_id: categories[2].id, author_id: users[0].id },
                       { title: 'Онлайн-тесты по литературе 9 класс', level: 2,
                         category_id: categories[2].id, author_id: users[0].id }
                     ])

questions = Question.create!([
                               {
                                 body: 'В 988 году великий князь Владимир в качестве государственной религии принял...', test_id: tests[0].id
                               },
                               {
                                 body: 'В IХ-ХIII веках столицей Древнерусского государства был город...', test_id: tests[0].id
                               },
                               { body: 'В 1237-1480 гг. Русь находилась в зависимости от...',
                                 test_id: tests[0].id },
                               {
                                 body: 'Как союзник Третьего Рейха потерпел поражение летом 1939 года?', test_id: tests[1].id
                               },
                               { body: 'Какое государство оккупировали итальянцы в 1936 году?',
                                 test_id: tests[1].id },
                               {
                                 body: 'Какая война завершилась накануне осуществления плана Маршалла?', test_id: tests[1].id
                               },
                               { body: 'Биосфера Земли — это:', test_id: tests[2].id },
                               { body: 'Как называется империя внеклеточных организмов?',
                                 test_id: tests[2].id },
                               { body: 'Сколько лет назад на Земле началось развитие жизни?',
                                 test_id: tests[2].id },
                               {
                                 body: 'В связи с полётом у птиц наиболее развиты следующие отделы головного мозга:', test_id: tests[3].id
                               },
                               {
                                 body: 'Через какие клеточные образования поступает углекислый газ в растения, используемый при фотосинтезе?', test_id: tests[3].id
                               },
                               {
                                 body: 'Что является доказательством происхождения человека от животных?', test_id: tests[3].id
                               },
                               { body: 'Фольклор -это:', test_id: tests[4].id },
                               { body: 'Как переводится слово "рифма" с греческого языка?',
                                 test_id: tests[4].id },
                               { body: 'Как переводится слово «фольклор» с английского языка?',
                                 test_id: tests[4].id },
                               { body: 'Как переводится слово "аллюзия" с латинского языка?',
                                 test_id: tests[5].id },
                               { body: 'Аллегорией на что является стрекоза в баснях Крылова?',
                                 test_id: tests[5].id },
                               { body: 'С чего начинается сочинение-рассуждение?',
                                 test_id: tests[5].id }
                             ])

answers = Answer.create!([
                           { body: 'Христианство', question_id: questions[0].id, correct: true },
                           { body: 'Ислам', question_id: questions[0].id },
                           { body: 'Иудаизм', question_id: questions[0].id },
                           { body: 'Москва', question_id: questions[1].id },
                           { body: 'Тверь', question_id: questions[1].id },
                           { body: 'Киев', question_id: questions[1].id, correct: true },
                           { body: 'Ливонского ордена', question_id: questions[2].id },
                           { body: 'Шведов', question_id: questions[2].id, correct: true },
                           { body: 'Золотой орды', question_id: questions[2].id },
                           { body: 'Италия', question_id: questions[3].id },
                           { body: 'Венгрия', question_id: questions[3].id },
                           { body: 'Япония', question_id: questions[3].id, correct: true },
                           { body: 'Алжир', question_id: questions[4].id },
                           { body: 'Албания', question_id: questions[4].id },
                           { body: 'Эфиопия', question_id: questions[4].id, correct: true },
                           { body: 'Первая мировая', question_id: questions[5].id },
                           { body: 'Вторая мировая', question_id: questions[5].id, correct: true },
                           { body: 'Франко-прусская', question_id: questions[5].id },
                           { body: 'Открытая система', question_id: questions[6].id, correct: true },
                           { body: 'Закрытая система', question_id: questions[6].id },
                           { body: 'Полузакрытая система', question_id: questions[6].id },
                           { body: 'Полуоткрытая система', question_id: questions[6].id },
                           { body: 'Буктерии', question_id: questions[7].id },
                           { body: 'Вирусы', question_id: questions[7].id, correct: true },
                           { body: 'Прокариоты', question_id: questions[7].id },
                           { body: '3,5 миллиарда лет назад', question_id: questions[8].id, correct: true },
                           { body: '1,5 миллиартда лет назад', question_id: questions[8].id },
                           { body: '3,5 миллиона лет назад', question_id: questions[8].id },
                           { body: 'Передний, средний, мозжечок', question_id: questions[9].id, correct: true },
                           { body: 'Средний продолговатый, мозжечок', question_id: questions[9].id },
                           { body: 'Передний, промежуточный, мозжечок', question_id: questions[9].id },
                           { body: 'Устьица в листьях', question_id: questions[10].id, correct: true },
                           { body: 'Клетки луба', question_id: questions[10].id },
                           { body: 'Корневые волоски', question_id: questions[10].id },
                           { body: 'Теплокровность', question_id: questions[11].id },
                           { body: 'Наличие рудиментов и атавизмов', question_id: questions[11].id, correct: true },
                           { body: 'Копчик в скелете', question_id: questions[11].id },
                           { body: 'Письменное и устное народное творчество', question_id: questions[12].id, correct: true },
                           { body: 'Устное народное творчество', question_id: questions[12].id },
                           { body: 'Письменное народное творчество', question_id: questions[12].id },
                           { body: 'Схожесть', question_id: questions[13].id },
                           { body: 'Стих', question_id: questions[13].id },
                           { body: 'Размеренность', question_id: questions[13].id, correct: true },
                           { body: 'Древняя песня', question_id: questions[14].id },
                           { body: 'Любовная баллада', question_id: questions[14].id },
                           { body: 'Народная мудрость', question_id: questions[14].id, correct: true },
                           { body: 'Намек', question_id: questions[15].id, correct: true },
                           { body: 'История', question_id: questions[15].id },
                           { body: 'Перемена', question_id: questions[15].id },
                           { body: 'Здоровье', question_id: questions[16].id },
                           { body: 'Легкомыские', question_id: questions[16].id, correct: true },
                           { body: 'Любовь', question_id: questions[16].id },
                           { body: 'Тезис', question_id: questions[17].id, correct: true },
                           { body: 'Аргумент', question_id: questions[17].id },
                           { body: 'Эпилог', question_id: questions[17].id }
                         ])
