Представим, что вы делаете сервис, где заказываются наборы еды. Пользователь покупает набор еды, который доставляется ему время от времени. Выбор отдельных блюд не предусмотрен. Единственное, что разрешается клиенту - исключить ингредиенты, на которые у него аллергия (мы же не хотим, чтобы он умер). Мы не привозим пользователю блюда с исключенными ингредиентами. В приложение есть сущность блюдо, у блюда есть состав (ингредиенты). Для упрощения задания, сами пользователи опускаются, есть просто главная страница, где можно чек-боксами выбрать исключаемые ингредиенты и создать заказ, набор исключенных ингредиентов определяет заказ. При нажатии отправить создается заказ, после чего происходит редирект обратно на главную.

Что для нашей схемы работы важно - меню обновляется регулярно по нашему усмотрению (для задания неважно как), но мы должны приготовить каждому пользователю актуальное меню, без исключенных им (потенциально опасных для него) ингредиентов. Для этого есть запрос, который возвращает для кухни общий список блюд на приготовление, в JSON вида [ { name: 'Омлет с брокколи', count: 10 }, { name: 'Овсяный сырник с вишней', count: 9 }, ...] count - количество блюд, которое надо приготовить, исходя из заказов. Массив ответа отсортирован в порядке убывания count. Вычисление количества блюд происходит в момент запроса, наиболее оптимальным с точки зрения производительности системы способом.

Покрытие кода тестами RSpec является плюсом. Должна быть команда, которая наполняет базу данными из yml файла. Используем последние версии Ruby, Rails и PSQL.