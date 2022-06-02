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
Badge.destroy_all

categories = Category.create!([
                                { title: 'История' },
                                { title: 'Биология' },
                                { title: 'Литература' }
                              ])

users = User.create!([
                       { first_name: 'Петр', last_name: 'Петров', type: 'User', 
                         email: 'petr@gmail.com', password: '123456' }
                     ])

tests = Test.create!([
                       { title: 'Онлайн-тесты по истории 5 класс', level: 1,
                         category: categories[0], author: users[0] },
                       { title: 'Онлайн-тесты по истории 9 класс', level: 2,
                         category: categories[0], author: users[0] },
                       { title: 'Онлайн-тесты по биологии 5 класс', level: 1,
                         category: categories[1], author: users[0] },
                       { title: 'Онлайн-тесты по биологии 9 класс', level: 2,
                         category: categories[1], author: users[0] },
                       { title: 'Онлайн-тесты по литературе 5 класс', level: 1,
                         category: categories[2], author: users[0] },
                       { title: 'Онлайн-тесты по литературе 9 класс', level: 2,
                         category: categories[2], author: users[0] }
                     ])

questions = Question.create!([
                               {
                                 body: 'В 988 году великий князь Владимир в качестве государственной религии принял...', test: tests[0]
                               },
                               {
                                 body: 'В IХ-ХIII веках столицей Древнерусского государства был город...', test: tests[0]
                               },
                               { body: 'В 1237-1480 гг. Русь находилась в зависимости от...',
                                 test: tests[0] },
                               {
                                 body: 'Как союзник Третьего Рейха потерпел поражение летом 1939 года?', test: tests[1]
                               },
                               { body: 'Какое государство оккупировали итальянцы в 1936 году?',
                                 test: tests[1] },
                               {
                                 body: 'Какая война завершилась накануне осуществления плана Маршалла?', test: tests[1]
                               },
                               { body: 'Биосфера Земли — это:', test: tests[2] },
                               { body: 'Как называется империя внеклеточных организмов?',
                                 test: tests[2] },
                               { body: 'Сколько лет назад на Земле началось развитие жизни?',
                                 test: tests[2] },
                               {
                                 body: 'В связи с полётом у птиц наиболее развиты следующие отделы головного мозга:', test: tests[3]
                               },
                               {
                                 body: 'Через какие клеточные образования поступает углекислый газ в растения, используемый при фотосинтезе?', test: tests[3]
                               },
                               {
                                 body: 'Что является доказательством происхождения человека от животных?', test: tests[3]
                               },
                               { body: 'Фольклор -это:', test: tests[4] },
                               { body: 'Как переводится слово "рифма" с греческого языка?',
                                 test: tests[4] },
                               { body: 'Как переводится слово «фольклор» с английского языка?',
                                 test: tests[4] },
                               { body: 'Как переводится слово "аллюзия" с латинского языка?',
                                 test: tests[5] },
                               { body: 'Аллегорией на что является стрекоза в баснях Крылова?',
                                 test: tests[5] },
                               { body: 'С чего начинается сочинение-рассуждение?',
                                 test: tests[5] }
                             ])

answers = Answer.create!([
                           { body: 'Христианство', question: questions[0], correct: true },
                           { body: 'Ислам', question: questions[0] },
                           { body: 'Иудаизм', question: questions[0] },
                           { body: 'Москва', question: questions[1] },
                           { body: 'Тверь', question: questions[1] },
                           { body: 'Киев', question: questions[1], correct: true },
                           { body: 'Ливонского ордена', question: questions[2] },
                           { body: 'Шведов', question: questions[2], correct: true },
                           { body: 'Золотой орды', question: questions[2] },
                           { body: 'Италия', question: questions[3] },
                           { body: 'Венгрия', question: questions[3] },
                           { body: 'Япония', question: questions[3], correct: true },
                           { body: 'Алжир', question: questions[4] },
                           { body: 'Албания', question: questions[4] },
                           { body: 'Эфиопия', question: questions[4], correct: true },
                           { body: 'Первая мировая', question: questions[5] },
                           { body: 'Вторая мировая', question: questions[5], correct: true },
                           { body: 'Франко-прусская', question: questions[5] },
                           { body: 'Открытая система', question: questions[6], correct: true },
                           { body: 'Закрытая система', question: questions[6] },
                           { body: 'Полузакрытая система', question: questions[6] },
                           { body: 'Полуоткрытая система', question: questions[6] },
                           { body: 'Буктерии', question: questions[7] },
                           { body: 'Вирусы', question: questions[7], correct: true },
                           { body: 'Прокариоты', question: questions[7] },
                           { body: '3,5 миллиарда лет назад', question: questions[8], correct: true },
                           { body: '1,5 миллиартда лет назад', question: questions[8] },
                           { body: '3,5 миллиона лет назад', question: questions[8] },
                           { body: 'Передний, средний, мозжечок', question: questions[9], correct: true },
                           { body: 'Средний продолговатый, мозжечок', question: questions[9] },
                           { body: 'Передний, промежуточный, мозжечок', question: questions[9] },
                           { body: 'Устьица в листьях', question: questions[10], correct: true },
                           { body: 'Клетки луба', question: questions[10] },
                           { body: 'Корневые волоски', question: questions[10] },
                           { body: 'Теплокровность', question: questions[11] },
                           { body: 'Наличие рудиментов и атавизмов', question: questions[11], correct: true },
                           { body: 'Копчик в скелете', question: questions[11] },
                           { body: 'Письменное и устное народное творчество', question: questions[12], correct: true },
                           { body: 'Устное народное творчество', question: questions[12] },
                           { body: 'Письменное народное творчество', question: questions[12] },
                           { body: 'Схожесть', question: questions[13] },
                           { body: 'Стих', question: questions[13] },
                           { body: 'Размеренность', question: questions[13], correct: true },
                           { body: 'Древняя песня', question: questions[14] },
                           { body: 'Любовная баллада', question: questions[14] },
                           { body: 'Народная мудрость', question: questions[14], correct: true },
                           { body: 'Намек', question: questions[15], correct: true },
                           { body: 'История', question: questions[15] },
                           { body: 'Перемена', question: questions[15] },
                           { body: 'Здоровье', question: questions[16] },
                           { body: 'Легкомыские', question: questions[16], correct: true },
                           { body: 'Любовь', question: questions[16] },
                           { body: 'Тезис', question: questions[17], correct: true },
                           { body: 'Аргумент', question: questions[17] },
                           { body: 'Эпилог', question: questions[17] }
                         ])

badges = Badge.create!([
                          { title: 'Биология', image: 'level1.png',
                            rule_name: 'all_tests_by_category', rule_value: categories[1].id },
                          { title: 'С первой попытки', image: 'first_try.png',
                            rule_name: 'first_test_passed', rule_value: tests[0].title},
                          { title: 'Уровень', image: 'badge.png',
                            rule_name: 'pass_test_by_level', rule_value: 1 }
                        ])
