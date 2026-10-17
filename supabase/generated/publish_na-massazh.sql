-- ========================================================
-- PUBLISH TENANT: СТУДИЯ МАССАЖА & SPA (na-massazh)
-- Generated automatically at: 2026-10-17T13:33:14.651Z
-- Preserves existing bookings, clients, and history!
-- ========================================================

DO $$
DECLARE
    v_tenant_id UUID := 'f8b92a10-4c7d-4e5a-9b1e-155086499918';
BEGIN
    -- 1. Upsert Tenant
    INSERT INTO tenants (
        id, slug, name, tagline, phone, address, city, timezone, currency,
        min_booking_notice_min, max_booking_horizon_days, cancellation_deadline_hours,
        theme_accent_color, theme_bg_color, instructions, updated_at
    ) VALUES (
        v_tenant_id, 'na-massazh', 'СТУДИЯ МАССАЖА & SPA', 
        'Пространство ручного массажа тела и лица, SPA-ритуалов и коррекции фигуры · Онлайн-запись 24/7', 
        '+7 (999) 000-70-70', 'Центральный район, ул. Пречистенка, 18 · 1 этаж, отдельный вход (своя парковка)', 'Москва', 
        'Europe/Moscow', 'RUB', 
        60, 45, 12, 
        '#D4A373', '#060608', 
        'Мы подготовили всё для вашего комфорта: изолированные тёплые кабинеты с душевыми, одноразовое бельё и простыни, мягкие халаты и тапочки, натуральные гипоаллергенные масла, а после сеанса — травяной сбор с мёдом и орехами в зоне отдыха.', now()
    )
    ON CONFLICT (slug) DO UPDATE SET
        name = EXCLUDED.name, tagline = EXCLUDED.tagline, phone = EXCLUDED.phone,
        address = EXCLUDED.address, city = EXCLUDED.city, timezone = EXCLUDED.timezone,
        min_booking_notice_min = EXCLUDED.min_booking_notice_min,
        max_booking_horizon_days = EXCLUDED.max_booking_horizon_days,
        cancellation_deadline_hours = EXCLUDED.cancellation_deadline_hours,
        theme_accent_color = EXCLUDED.theme_accent_color,
        theme_bg_color = EXCLUDED.theme_bg_color,
        instructions = EXCLUDED.instructions,
        updated_at = now();

    -- 2. Upsert Studio Business Hours
    INSERT INTO studio_business_hours (tenant_id, day_of_week, open_time, close_time, is_closed)
    VALUES (v_tenant_id, 0, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, day_of_week) DO UPDATE SET
        open_time = EXCLUDED.open_time, close_time = EXCLUDED.close_time, is_closed = EXCLUDED.is_closed;
    INSERT INTO studio_business_hours (tenant_id, day_of_week, open_time, close_time, is_closed)
    VALUES (v_tenant_id, 1, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, day_of_week) DO UPDATE SET
        open_time = EXCLUDED.open_time, close_time = EXCLUDED.close_time, is_closed = EXCLUDED.is_closed;
    INSERT INTO studio_business_hours (tenant_id, day_of_week, open_time, close_time, is_closed)
    VALUES (v_tenant_id, 2, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, day_of_week) DO UPDATE SET
        open_time = EXCLUDED.open_time, close_time = EXCLUDED.close_time, is_closed = EXCLUDED.is_closed;
    INSERT INTO studio_business_hours (tenant_id, day_of_week, open_time, close_time, is_closed)
    VALUES (v_tenant_id, 3, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, day_of_week) DO UPDATE SET
        open_time = EXCLUDED.open_time, close_time = EXCLUDED.close_time, is_closed = EXCLUDED.is_closed;
    INSERT INTO studio_business_hours (tenant_id, day_of_week, open_time, close_time, is_closed)
    VALUES (v_tenant_id, 4, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, day_of_week) DO UPDATE SET
        open_time = EXCLUDED.open_time, close_time = EXCLUDED.close_time, is_closed = EXCLUDED.is_closed;
    INSERT INTO studio_business_hours (tenant_id, day_of_week, open_time, close_time, is_closed)
    VALUES (v_tenant_id, 5, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, day_of_week) DO UPDATE SET
        open_time = EXCLUDED.open_time, close_time = EXCLUDED.close_time, is_closed = EXCLUDED.is_closed;
    INSERT INTO studio_business_hours (tenant_id, day_of_week, open_time, close_time, is_closed)
    VALUES (v_tenant_id, 6, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, day_of_week) DO UPDATE SET
        open_time = EXCLUDED.open_time, close_time = EXCLUDED.close_time, is_closed = EXCLUDED.is_closed;

    -- 3. Upsert Workplaces
    INSERT INTO workplaces (id, tenant_id, name, type, is_active)
    VALUES ('10000000-0000-4000-8000-000000000001', v_tenant_id, 'Массажный кабинет №1 (Оздоровительный и спортивный массаж)', 'UNIVERSAL', true)
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, type = EXCLUDED.type, is_active = EXCLUDED.is_active;
    INSERT INTO workplaces (id, tenant_id, name, type, is_active)
    VALUES ('10000000-0000-4000-8000-000000000002', v_tenant_id, 'SPA-кабинет №2 (Стоун-терапия, обёртывания и релакс)', 'UNIVERSAL', true)
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, type = EXCLUDED.type, is_active = EXCLUDED.is_active;
    INSERT INTO workplaces (id, tenant_id, name, type, is_active)
    VALUES ('10000000-0000-4000-8000-000000000003', v_tenant_id, 'Кабинет эстетики лица и тела №3', 'UNIVERSAL', true)
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, type = EXCLUDED.type, is_active = EXCLUDED.is_active;

    -- 4. Upsert Categories
    INSERT INTO service_categories (id, tenant_id, name, display_order, is_active)
    VALUES ('20000000-0000-4000-8000-000000000001', v_tenant_id, 'Пробный визит', 1, true)
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_categories (id, tenant_id, name, display_order, is_active)
    VALUES ('20000000-0000-4000-8000-000000000002', v_tenant_id, 'Массаж тела и спины', 2, true)
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_categories (id, tenant_id, name, display_order, is_active)
    VALUES ('20000000-0000-4000-8000-000000000003', v_tenant_id, 'Коррекция фигуры', 3, true)
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_categories (id, tenant_id, name, display_order, is_active)
    VALUES ('20000000-0000-4000-8000-000000000004', v_tenant_id, 'Массаж лица', 4, true)
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_categories (id, tenant_id, name, display_order, is_active)
    VALUES ('20000000-0000-4000-8000-000000000005', v_tenant_id, 'Релакс и SPA-ритуалы', 5, true)
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_categories (id, tenant_id, name, display_order, is_active)
    VALUES ('20000000-0000-4000-8000-000000000006', v_tenant_id, 'Локальные зоны и курсы', 6, true)
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;

    -- 5. Upsert Services
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000001', v_tenant_id, '20000000-0000-4000-8000-000000000001', 'Пробный сеанс массажа тела (60 мин)', 
        'Специальное предложение первого визита: диагностика мышечных зажимов, индивидуальный подбор техники (классический, лимфодренажный или расслабляющий массаж) и рекомендации мастера.', 
        2500, 60, 15, 'UNIVERSAL', 
        '/tenants/na-massazh/images/gallery-cabin-1.jpg', 1, true, now()
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        category_id = EXCLUDED.category_id, name = EXCLUDED.name, description = EXCLUDED.description,
        price = EXCLUDED.price, duration_min = EXCLUDED.duration_min,
        buffer_after_min = EXCLUDED.buffer_after_min,
        required_workplace_type = EXCLUDED.required_workplace_type,
        image_url = EXCLUDED.image_url, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active, updated_at = now();
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000002', v_tenant_id, '20000000-0000-4000-8000-000000000001', 'Пробный сеанс скульптурирующего массажа лица (45 мин)', 
        'Знакомство с авторскими техниками безоперационного лифтинга: снятие отёчности, расслабление мимических мышц и заметный тонус кожи уже после первого сеанса.', 
        2000, 45, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-face-massage.jpg', 2, true, now()
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        category_id = EXCLUDED.category_id, name = EXCLUDED.name, description = EXCLUDED.description,
        price = EXCLUDED.price, duration_min = EXCLUDED.duration_min,
        buffer_after_min = EXCLUDED.buffer_after_min,
        required_workplace_type = EXCLUDED.required_workplace_type,
        image_url = EXCLUDED.image_url, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active, updated_at = now();
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000003', v_tenant_id, '20000000-0000-4000-8000-000000000001', 'Комплекс «Первое знакомство»: массаж тела + лицо (90 мин)', 
        'Полная перезагрузка на первом визите: 60 минут глубокого или расслабляющего массажа всего тела + 30 минут лимфодренажного массажа лица и чайная церемония.', 
        3900, 90, 15, 'UNIVERSAL', 
        '/tenants/na-massazh/images/gallery-lounge-tea.jpg', 3, true, now()
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        category_id = EXCLUDED.category_id, name = EXCLUDED.name, description = EXCLUDED.description,
        price = EXCLUDED.price, duration_min = EXCLUDED.duration_min,
        buffer_after_min = EXCLUDED.buffer_after_min,
        required_workplace_type = EXCLUDED.required_workplace_type,
        image_url = EXCLUDED.image_url, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active, updated_at = now();
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000004', v_tenant_id, '20000000-0000-4000-8000-000000000002', 'Классический оздоровительный массаж всего тела (60 мин)', 
        'Базовая проработка всех мышечных групп от стоп до шейно-воротниковой зоны. Улучшает кровообращение, снимает накопленную усталость и возвращает лёгкость движений.', 
        3200, 60, 15, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-classic-body.jpg', 4, true, now()
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        category_id = EXCLUDED.category_id, name = EXCLUDED.name, description = EXCLUDED.description,
        price = EXCLUDED.price, duration_min = EXCLUDED.duration_min,
        buffer_after_min = EXCLUDED.buffer_after_min,
        required_workplace_type = EXCLUDED.required_workplace_type,
        image_url = EXCLUDED.image_url, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active, updated_at = now();
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000005', v_tenant_id, '20000000-0000-4000-8000-000000000002', 'Глубокотканный массаж тела — Полная проработка (90 мин)', 
        'Полуторачасовой сеанс детальной проработки глубоких слоёв мышц и фасций. Устраняет хронические спазмы в спине и пояснице, восстанавливает осанку и подвижность суставов.', 
        4500, 90, 15, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-deep-back.jpg', 5, true, now()
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        category_id = EXCLUDED.category_id, name = EXCLUDED.name, description = EXCLUDED.description,
        price = EXCLUDED.price, duration_min = EXCLUDED.duration_min,
        buffer_after_min = EXCLUDED.buffer_after_min,
        required_workplace_type = EXCLUDED.required_workplace_type,
        image_url = EXCLUDED.image_url, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active, updated_at = now();
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000006', v_tenant_id, '20000000-0000-4000-8000-000000000002', 'Массаж спины и шейно-воротниковой зоны (45 мин)', 
        'Прицельная работа с главной зоной напряжения при сидячей работе: снятие скованности в плечах, лопатках и шее, профилактика головных болей и остеохондроза.', 
        2200, 45, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-neck-collar.jpg', 6, true, now()
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        category_id = EXCLUDED.category_id, name = EXCLUDED.name, description = EXCLUDED.description,
        price = EXCLUDED.price, duration_min = EXCLUDED.duration_min,
        buffer_after_min = EXCLUDED.buffer_after_min,
        required_workplace_type = EXCLUDED.required_workplace_type,
        image_url = EXCLUDED.image_url, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active, updated_at = now();
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000007', v_tenant_id, '20000000-0000-4000-8000-000000000002', 'Спортивный силовой и миофасциальный массаж (60 мин)', 
        'Интенсивная проработка мышц и триггерных точек после физических нагрузок и тренировок. Ускоряет выведение молочной кислоты, повышает эластичность связок и тонус.', 
        3800, 60, 15, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-sports-massage.jpg', 7, true, now()
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        category_id = EXCLUDED.category_id, name = EXCLUDED.name, description = EXCLUDED.description,
        price = EXCLUDED.price, duration_min = EXCLUDED.duration_min,
        buffer_after_min = EXCLUDED.buffer_after_min,
        required_workplace_type = EXCLUDED.required_workplace_type,
        image_url = EXCLUDED.image_url, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active, updated_at = now();
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000008', v_tenant_id, '20000000-0000-4000-8000-000000000003', 'Лимфодренажный детокс-массаж тела (60 мин)', 
        'Мягкая волнообразная техника по ходу лимфатических сосудов: выводит лишнюю жидкость, снимает отёчность ног и тела, укрепляет иммунитет и дарит ощущение невесомости.', 
        3400, 60, 15, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-lymphatic-body.jpg', 8, true, now()
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        category_id = EXCLUDED.category_id, name = EXCLUDED.name, description = EXCLUDED.description,
        price = EXCLUDED.price, duration_min = EXCLUDED.duration_min,
        buffer_after_min = EXCLUDED.buffer_after_min,
        required_workplace_type = EXCLUDED.required_workplace_type,
        image_url = EXCLUDED.image_url, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active, updated_at = now();
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000009', v_tenant_id, '20000000-0000-4000-8000-000000000003', 'Антицеллюлитный скульптурирующий массаж (60 мин)', 
        'Активная ручная коррекция проблемных зон (бёдра, ягодицы, живот, талия) без травмирования сосудов и синяков. Выравнивает микрорельеф и повышает упругость кожи.', 
        3600, 60, 15, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-anticellulite.jpg', 9, true, now()
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        category_id = EXCLUDED.category_id, name = EXCLUDED.name, description = EXCLUDED.description,
        price = EXCLUDED.price, duration_min = EXCLUDED.duration_min,
        buffer_after_min = EXCLUDED.buffer_after_min,
        required_workplace_type = EXCLUDED.required_workplace_type,
        image_url = EXCLUDED.image_url, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active, updated_at = now();
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000010', v_tenant_id, '20000000-0000-4000-8000-000000000003', 'Моделирующий креольский массаж бамбуковыми палочками (60 мин)', 
        'Ритмичная ударно-вибрационная техника специальными гладкими палочками из натурального бамбука: мощный лифтинг-эффект, разгон метаболизма и контурирование силуэта.', 
        3800, 60, 15, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-bamboo-slim.jpg', 10, true, now()
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        category_id = EXCLUDED.category_id, name = EXCLUDED.name, description = EXCLUDED.description,
        price = EXCLUDED.price, duration_min = EXCLUDED.duration_min,
        buffer_after_min = EXCLUDED.buffer_after_min,
        required_workplace_type = EXCLUDED.required_workplace_type,
        image_url = EXCLUDED.image_url, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active, updated_at = now();
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000011', v_tenant_id, '20000000-0000-4000-8000-000000000004', 'Скульптурно-буккальный лифтинг-массаж лица (50 мин)', 
        'Глубокая двусторонняя проработка мимических и жевательных мышц лица, шеи и зоны декольте. Формирует чёткий овал, скулы, разглаживает заломы и снимает бруксизм.', 
        3000, 50, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-face-massage.jpg', 11, true, now()
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        category_id = EXCLUDED.category_id, name = EXCLUDED.name, description = EXCLUDED.description,
        price = EXCLUDED.price, duration_min = EXCLUDED.duration_min,
        buffer_after_min = EXCLUDED.buffer_after_min,
        required_workplace_type = EXCLUDED.required_workplace_type,
        image_url = EXCLUDED.image_url, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active, updated_at = now();
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000012', v_tenant_id, '20000000-0000-4000-8000-000000000004', 'SPA-уход для лица «Сияние и Лифтинг»: массаж + маска (60 мин)', 
        'Комплексная эстетическая процедура: деликатное очищение, миофасциальный лимфодренажный массаж лица и шеи, завершающая моделирующая маска по типу кожи.', 
        3500, 60, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-face-buccal.jpg', 12, true, now()
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        category_id = EXCLUDED.category_id, name = EXCLUDED.name, description = EXCLUDED.description,
        price = EXCLUDED.price, duration_min = EXCLUDED.duration_min,
        buffer_after_min = EXCLUDED.buffer_after_min,
        required_workplace_type = EXCLUDED.required_workplace_type,
        image_url = EXCLUDED.image_url, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active, updated_at = now();
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000013', v_tenant_id, '20000000-0000-4000-8000-000000000005', 'Расслабляющий арома-массаж на тёплых натуральных маслах (60 мин)', 
        'Плавная обволакивающая техника под спокойную музыку при свечах с выбором композиции эфирных масел (лаванда, сандал, лемонграсс, иланг-иланг). Глубокий антистресс и восстановление сна.', 
        3300, 60, 15, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-aroma-relax.jpg', 13, true, now()
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        category_id = EXCLUDED.category_id, name = EXCLUDED.name, description = EXCLUDED.description,
        price = EXCLUDED.price, duration_min = EXCLUDED.duration_min,
        buffer_after_min = EXCLUDED.buffer_after_min,
        required_workplace_type = EXCLUDED.required_workplace_type,
        image_url = EXCLUDED.image_url, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active, updated_at = now();
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000014', v_tenant_id, '20000000-0000-4000-8000-000000000005', 'Стоун-терапия — массаж горячими базальтовыми камнями (90 мин)', 
        'Глубокое прогревание мышц гладкими камнями вулканического базальта в сочетании с ручным oil-массажем. Мгновенно растворяет мышечные блоки, согревает и гармонизирует нервную систему.', 
        4800, 90, 15, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-hot-stone.jpg', 14, true, now()
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        category_id = EXCLUDED.category_id, name = EXCLUDED.name, description = EXCLUDED.description,
        price = EXCLUDED.price, duration_min = EXCLUDED.duration_min,
        buffer_after_min = EXCLUDED.buffer_after_min,
        required_workplace_type = EXCLUDED.required_workplace_type,
        image_url = EXCLUDED.image_url, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active, updated_at = now();
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000015', v_tenant_id, '20000000-0000-4000-8000-000000000005', 'SPA-ритуал «Полная перезагрузка»: скраб + обёртывание + массаж (120 мин)', 
        'Двухчасовая курортная программа в одном визите: солевой или кофейный фито-пилинг тела, питательное водорослевое обёртывание, часовой расслабляющий массаж и чайная церемония.', 
        6500, 120, 20, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-spa-wrap.jpg', 15, true, now()
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        category_id = EXCLUDED.category_id, name = EXCLUDED.name, description = EXCLUDED.description,
        price = EXCLUDED.price, duration_min = EXCLUDED.duration_min,
        buffer_after_min = EXCLUDED.buffer_after_min,
        required_workplace_type = EXCLUDED.required_workplace_type,
        image_url = EXCLUDED.image_url, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active, updated_at = now();
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000016', v_tenant_id, '20000000-0000-4000-8000-000000000006', 'Антистресс-массаж головы, висков и шейного отдела (30 мин)', 
        'Проработка апоневроза головы, затылочных бугров и шеи: снимает умственное переутомление, мигрени, улучшает кровоснабжение и стимулирует рост волос.', 
        1600, 30, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-head-massage.jpg', 16, true, now()
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        category_id = EXCLUDED.category_id, name = EXCLUDED.name, description = EXCLUDED.description,
        price = EXCLUDED.price, duration_min = EXCLUDED.duration_min,
        buffer_after_min = EXCLUDED.buffer_after_min,
        required_workplace_type = EXCLUDED.required_workplace_type,
        image_url = EXCLUDED.image_url, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active, updated_at = now();
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000017', v_tenant_id, '20000000-0000-4000-8000-000000000006', 'Рефлекторный SPA-массаж стоп и голеней (40 мин)', 
        'Тёплая ванночка, проработка биологически активных точек стопы и икроножных мышц. Мгновенно снимает тяжесть в ногах после долгого дня и глубоко расслабляет.', 
        1800, 40, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-foot-reflex.jpg', 17, true, now()
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        category_id = EXCLUDED.category_id, name = EXCLUDED.name, description = EXCLUDED.description,
        price = EXCLUDED.price, duration_min = EXCLUDED.duration_min,
        buffer_after_min = EXCLUDED.buffer_after_min,
        required_workplace_type = EXCLUDED.required_workplace_type,
        image_url = EXCLUDED.image_url, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active, updated_at = now();
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000018', v_tenant_id, '20000000-0000-4000-8000-000000000006', 'Абонемент: курс из 5 сеансов массажа тела (60 мин)', 
        'Выгодный курс из 5 часовых сеансов на выбор (оздоровительный, лимфодренажный, антицеллюлитный или релакс). Оформление абонемента и проведение первого сеанса в день записи.', 
        13500, 60, 15, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-course-pass.jpg', 18, true, now()
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        category_id = EXCLUDED.category_id, name = EXCLUDED.name, description = EXCLUDED.description,
        price = EXCLUDED.price, duration_min = EXCLUDED.duration_min,
        buffer_after_min = EXCLUDED.buffer_after_min,
        required_workplace_type = EXCLUDED.required_workplace_type,
        image_url = EXCLUDED.image_url, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active, updated_at = now();

    -- 6. Upsert Service Options
    INSERT INTO service_options (
        id, tenant_id, service_id, name, description, price, duration_min, buffer_after_min, display_order, is_active
    ) VALUES (
        '40000000-0000-4000-8000-000000000001', v_tenant_id, NULL, 
        'Прогревание горячими базальтовыми камнями (+15 мин)', 'Локальная стоун-терапия спины перед ручным массажем для глубокого расслабления мышц', 
        700, 15, 0, 1, true
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, description = EXCLUDED.description, price = EXCLUDED.price,
        duration_min = EXCLUDED.duration_min, buffer_after_min = EXCLUDED.buffer_after_min,
        display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_options (
        id, tenant_id, service_id, name, description, price, duration_min, buffer_after_min, display_order, is_active
    ) VALUES (
        '40000000-0000-4000-8000-000000000002', v_tenant_id, NULL, 
        'Вакуумно-баночная проработка проблемных зон (+15 мин)', 'Усиление лимфодренажного или миофасциального эффекта вакуумными банками', 
        600, 15, 0, 2, true
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, description = EXCLUDED.description, price = EXCLUDED.price,
        duration_min = EXCLUDED.duration_min, buffer_after_min = EXCLUDED.buffer_after_min,
        display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_options (
        id, tenant_id, service_id, name, description, price, duration_min, buffer_after_min, display_order, is_active
    ) VALUES (
        '40000000-0000-4000-8000-000000000003', v_tenant_id, NULL, 
        'SPA-обёртывание тела (водорослевое / шоколадное, +30 мин)', 'Детокс-обёртывание под термоодеялом после массажа для упругости и бархатной кожи', 
        1500, 30, 0, 3, true
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, description = EXCLUDED.description, price = EXCLUDED.price,
        duration_min = EXCLUDED.duration_min, buffer_after_min = EXCLUDED.buffer_after_min,
        display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_options (
        id, tenant_id, service_id, name, description, price, duration_min, buffer_after_min, display_order, is_active
    ) VALUES (
        '40000000-0000-4000-8000-000000000004', v_tenant_id, NULL, 
        'Фито-скрабирование тела перед массажем (+20 мин)', 'Мягкий солевой или кофейный пилинг для обновления кожи и глубокого впитывания масел', 
        1200, 20, 0, 4, true
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, description = EXCLUDED.description, price = EXCLUDED.price,
        duration_min = EXCLUDED.duration_min, buffer_after_min = EXCLUDED.buffer_after_min,
        display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_options (
        id, tenant_id, service_id, name, description, price, duration_min, buffer_after_min, display_order, is_active
    ) VALUES (
        '40000000-0000-4000-8000-000000000005', v_tenant_id, NULL, 
        'Массаж головы и шейного отдела (+15 мин к сеансу)', 'Расслабляющая проработка кожи головы и затылочной зоны', 
        700, 15, 0, 5, true
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, description = EXCLUDED.description, price = EXCLUDED.price,
        duration_min = EXCLUDED.duration_min, buffer_after_min = EXCLUDED.buffer_after_min,
        display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_options (
        id, tenant_id, service_id, name, description, price, duration_min, buffer_after_min, display_order, is_active
    ) VALUES (
        '40000000-0000-4000-8000-000000000006', v_tenant_id, NULL, 
        'Рефлекторный массаж стоп (+15 мин к сеансу)', 'Проработка стоп для снятия усталости и тяжести в ногах', 
        700, 15, 0, 6, true
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, description = EXCLUDED.description, price = EXCLUDED.price,
        duration_min = EXCLUDED.duration_min, buffer_after_min = EXCLUDED.buffer_after_min,
        display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_options (
        id, tenant_id, service_id, name, description, price, duration_min, buffer_after_min, display_order, is_active
    ) VALUES (
        '40000000-0000-4000-8000-000000000007', v_tenant_id, NULL, 
        'Премиальный арома-купаж масел или липолитический крем', 'Выбор органического эфирного масла или разогревающего крема-скульптора', 
        500, 0, 0, 7, true
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, description = EXCLUDED.description, price = EXCLUDED.price,
        duration_min = EXCLUDED.duration_min, buffer_after_min = EXCLUDED.buffer_after_min,
        display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;

    -- 7. Upsert Masters
    INSERT INTO masters (
        id, tenant_id, name, title, bio, avatar_url, rating, reviews_count, display_order, is_active
    ) VALUES (
        '50000000-0000-4000-8000-000000000001', v_tenant_id, 'Елена Морозова', 'Топ-мастер по оздоровительному массажу и реабилитации', 
        'Медицинское образование, стаж 9 лет. Специализируется на глубокой проработке спины, шейно-воротниковой зоны и триггерных точек, восстановлении после нагрузок без боли.', 
        '/tenants/na-massazh/images/master-elena.jpg', 
        5, 94, 1, true
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, title = EXCLUDED.title, bio = EXCLUDED.bio,
        avatar_url = EXCLUDED.avatar_url, rating = EXCLUDED.rating,
        reviews_count = EXCLUDED.reviews_count, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000001') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000003') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000004') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000005') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000006') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000007') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000008') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000013') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000014') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000016') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000017') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000018') ON CONFLICT DO NOTHING;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', 0, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', 1, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', 2, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', 3, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', 4, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', 5, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', 6, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO masters (
        id, tenant_id, name, title, bio, avatar_url, rating, reviews_count, display_order, is_active
    ) VALUES (
        '50000000-0000-4000-8000-000000000002', v_tenant_id, 'Зарина Ветрова', 'Топ-мастер коррекции фигуры, лимфодренажа и SPA', 
        'Опыт 7 лет. Эксперт по скульптурирующему и лимфодренажному массажу тела, креольской бамбук-терапии и детокс-обёртываниям с видимым результатом после первого курса.', 
        '/tenants/na-massazh/images/master-zara.jpg', 
        5, 68, 2, true
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, title = EXCLUDED.title, bio = EXCLUDED.bio,
        avatar_url = EXCLUDED.avatar_url, rating = EXCLUDED.rating,
        reviews_count = EXCLUDED.reviews_count, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000001') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000003') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000004') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000005') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000008') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000009') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000010') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000013') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000014') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000015') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000017') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000018') ON CONFLICT DO NOTHING;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', 0, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', 1, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', 2, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', 3, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', 4, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', 5, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', 6, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO masters (
        id, tenant_id, name, title, bio, avatar_url, rating, reviews_count, display_order, is_active
    ) VALUES (
        '50000000-0000-4000-8000-000000000003', v_tenant_id, 'Гульнара Алиева', 'Топ-мастер по скульптурированию и пластике лица', 
        'Косметолог-эстетист со стажем 8 лет. Владеет техниками скульптурно-буккального, миофасциального и японского массажа лица, шеи и зоны декольте.', 
        '/tenants/na-massazh/images/master-gulya.jpg', 
        4.99, 53, 3, true
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, title = EXCLUDED.title, bio = EXCLUDED.bio,
        avatar_url = EXCLUDED.avatar_url, rating = EXCLUDED.rating,
        reviews_count = EXCLUDED.reviews_count, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', '30000000-0000-4000-8000-000000000002') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', '30000000-0000-4000-8000-000000000003') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', '30000000-0000-4000-8000-000000000011') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', '30000000-0000-4000-8000-000000000012') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', '30000000-0000-4000-8000-000000000013') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', '30000000-0000-4000-8000-000000000015') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', '30000000-0000-4000-8000-000000000016') ON CONFLICT DO NOTHING;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', 0, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', 1, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', 2, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', 3, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', 4, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', 5, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', 6, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO masters (
        id, tenant_id, name, title, bio, avatar_url, rating, reviews_count, display_order, is_active
    ) VALUES (
        '50000000-0000-4000-8000-000000000004', v_tenant_id, 'Алла Соколова', 'Мастер классического, релакс и стоун-массажа', 
        'Опыт 6 лет. Мастер глубокого расслабления, стоун-терапии горячими базальтовыми камнями, тайского массажа стоп и комплексных SPA-программ.', 
        '/tenants/na-massazh/images/master-alla.jpg', 
        4.98, 47, 4, true
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, title = EXCLUDED.title, bio = EXCLUDED.bio,
        avatar_url = EXCLUDED.avatar_url, rating = EXCLUDED.rating,
        reviews_count = EXCLUDED.reviews_count, display_order = EXCLUDED.display_order,
        is_active = EXCLUDED.is_active;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000001') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000002') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000003') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000004') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000005') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000006') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000008') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000011') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000013') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000014') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000015') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000016') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000017') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000018') ON CONFLICT DO NOTHING;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', 0, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', 1, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', 2, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', 3, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', 4, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', 5, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', 6, '09:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;

    RAISE NOTICE 'Tenant "%" published successfully.', 'na-massazh';
END $$;