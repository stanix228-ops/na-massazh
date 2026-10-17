-- ========================================================
-- PUBLISH TENANT: НА МАССАЖ (na-massazh)
-- Generated automatically at: 2026-10-17T08:38:16.677Z
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
        v_tenant_id, 'na-massazh', 'НА МАССАЖ', 
        'Студия массажа, SPA и коррекции фигуры на Арбате · Ручной массаж тела и лица', 
        '+7 (925) 135-70-70', 'Большой Кисловский переулок, 1, стр. 2, этаж 3, офис 318 (м. Арбатская)', 'Москва', 
        'Europe/Moscow', 'RUB', 
        60, 45, 12, 
        '#D9468F', '#060508', 
        '5 минут пешком от м. Арбатская, Александровский сад или Библиотека им. Ленина. Большой Кисловский переулок, д. 1, стр. 2 — поднимитесь на 3 этаж, офис 318 (вывеска «Студия массажа Go2massage»). В студии предоставляются одноразовое бельё, простыни, тапочки, свежий чай и кофе.', now()
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
    VALUES (v_tenant_id, 0, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, day_of_week) DO UPDATE SET
        open_time = EXCLUDED.open_time, close_time = EXCLUDED.close_time, is_closed = EXCLUDED.is_closed;
    INSERT INTO studio_business_hours (tenant_id, day_of_week, open_time, close_time, is_closed)
    VALUES (v_tenant_id, 1, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, day_of_week) DO UPDATE SET
        open_time = EXCLUDED.open_time, close_time = EXCLUDED.close_time, is_closed = EXCLUDED.is_closed;
    INSERT INTO studio_business_hours (tenant_id, day_of_week, open_time, close_time, is_closed)
    VALUES (v_tenant_id, 2, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, day_of_week) DO UPDATE SET
        open_time = EXCLUDED.open_time, close_time = EXCLUDED.close_time, is_closed = EXCLUDED.is_closed;
    INSERT INTO studio_business_hours (tenant_id, day_of_week, open_time, close_time, is_closed)
    VALUES (v_tenant_id, 3, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, day_of_week) DO UPDATE SET
        open_time = EXCLUDED.open_time, close_time = EXCLUDED.close_time, is_closed = EXCLUDED.is_closed;
    INSERT INTO studio_business_hours (tenant_id, day_of_week, open_time, close_time, is_closed)
    VALUES (v_tenant_id, 4, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, day_of_week) DO UPDATE SET
        open_time = EXCLUDED.open_time, close_time = EXCLUDED.close_time, is_closed = EXCLUDED.is_closed;
    INSERT INTO studio_business_hours (tenant_id, day_of_week, open_time, close_time, is_closed)
    VALUES (v_tenant_id, 5, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, day_of_week) DO UPDATE SET
        open_time = EXCLUDED.open_time, close_time = EXCLUDED.close_time, is_closed = EXCLUDED.is_closed;
    INSERT INTO studio_business_hours (tenant_id, day_of_week, open_time, close_time, is_closed)
    VALUES (v_tenant_id, 6, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, day_of_week) DO UPDATE SET
        open_time = EXCLUDED.open_time, close_time = EXCLUDED.close_time, is_closed = EXCLUDED.is_closed;

    -- 3. Upsert Workplaces
    INSERT INTO workplaces (id, tenant_id, name, type, is_active)
    VALUES ('10000000-0000-4000-8000-000000000001', v_tenant_id, 'Массажный кабинет №1 (Тело и SPA)', 'UNIVERSAL', true)
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, type = EXCLUDED.type, is_active = EXCLUDED.is_active;
    INSERT INTO workplaces (id, tenant_id, name, type, is_active)
    VALUES ('10000000-0000-4000-8000-000000000002', v_tenant_id, 'Массажный кабинет №2 (Спортивный и коррекция фигуры)', 'UNIVERSAL', true)
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, type = EXCLUDED.type, is_active = EXCLUDED.is_active;
    INSERT INTO workplaces (id, tenant_id, name, type, is_active)
    VALUES ('10000000-0000-4000-8000-000000000003', v_tenant_id, 'Кабинет массажа лица и SPA-ухода №3', 'UNIVERSAL', true)
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, type = EXCLUDED.type, is_active = EXCLUDED.is_active;

    -- 4. Upsert Categories
    INSERT INTO service_categories (id, tenant_id, name, display_order, is_active)
    VALUES ('20000000-0000-4000-8000-000000000001', v_tenant_id, 'Пробный сеанс', 1, true)
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_categories (id, tenant_id, name, display_order, is_active)
    VALUES ('20000000-0000-4000-8000-000000000002', v_tenant_id, 'Массаж тела', 2, true)
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_categories (id, tenant_id, name, display_order, is_active)
    VALUES ('20000000-0000-4000-8000-000000000003', v_tenant_id, 'Мужской и спортивный', 3, true)
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_categories (id, tenant_id, name, display_order, is_active)
    VALUES ('20000000-0000-4000-8000-000000000004', v_tenant_id, 'Массаж лица', 4, true)
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_categories (id, tenant_id, name, display_order, is_active)
    VALUES ('20000000-0000-4000-8000-000000000005', v_tenant_id, 'Голова, стопы и SPA', 5, true)
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_categories (id, tenant_id, name, display_order, is_active)
    VALUES ('20000000-0000-4000-8000-000000000006', v_tenant_id, 'Абонементы и курсы', 6, true)
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;

    -- 5. Upsert Services
    INSERT INTO services (
        id, tenant_id, category_id, name, description, price, duration_min,
        buffer_after_min, required_workplace_type, image_url, display_order, is_active, updated_at
    ) VALUES (
        '30000000-0000-4000-8000-000000000001', v_tenant_id, '20000000-0000-4000-8000-000000000001', 'Пробный сеанс массажа тела (55 мин)', 
        'Специальная цена первого визита для знакомства со студией и мастером: комплексная проработка тела, снятие зажимов, отёчности и усталости (акция действует для новых гостей — девушек).', 
        3000, 55, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/gallery-room-1.jpg', 1, true, now()
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
        '30000000-0000-4000-8000-000000000002', v_tenant_id, '20000000-0000-4000-8000-000000000001', 'Пробный сеанс массажа лица (30 мин)', 
        'Знакомство с техниками скульптурирующего и лимфодренажного массажа лица: снятие отёчности, свежий цвет лица и мгновенный тонус кожи.', 
        2000, 30, 10, 'UNIVERSAL', 
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
        '30000000-0000-4000-8000-000000000003', v_tenant_id, '20000000-0000-4000-8000-000000000001', 'Пробный комплекс: тело 55 мин + лицо 30 мин', 
        'Полная перезагрузка на первом визите: 55 минут глубокого или расслабляющего массажа всего тела + 30 минут лифтинг-массажа лица.', 
        5000, 85, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/gallery-reception.jpg', 3, true, now()
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
        '30000000-0000-4000-8000-000000000004', v_tenant_id, '20000000-0000-4000-8000-000000000002', 'Массаж тела 55 мин (Общий / Лимфодренажный / Антицеллюлитный / Релакс)', 
        'Комплексная процедура на выбор по вашему запросу: классический оздоровительный, антицеллюлитный, лимфодренажный или расслабляющий массаж. Снимает спазмы в спине и ШВЗ, ускоряет лимфоток.', 
        3500, 55, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/gallery-massage-process.jpg', 4, true, now()
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
        '30000000-0000-4000-8000-000000000005', v_tenant_id, '20000000-0000-4000-8000-000000000002', 'Массаж тела 85 мин (Глубокая комплексная проработка)', 
        'Расширенный полуторачасовой сеанс массажа всего тела от стоп до макушки. Детальная проработка триггерных зон спины, шеи и поясницы, глубокий лимфодренаж и восстановление ресурса.', 
        5000, 85, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-lymphatic-body.jpg', 5, true, now()
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
        '30000000-0000-4000-8000-000000000006', v_tenant_id, '20000000-0000-4000-8000-000000000002', 'Массаж тела 55 мин — Топ-мастер', 
        'Авторский сеанс у топ-мастера студии с медицинским образованием: индивидуальное сочетание миофасциальных, оздоровительных и моделирующих техник без боли и синяков.', 
        4500, 55, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/gallery-room-bamboo.jpg', 6, true, now()
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
        '30000000-0000-4000-8000-000000000007', v_tenant_id, '20000000-0000-4000-8000-000000000002', 'Массаж тела 85 мин — Топ-мастер', 
        'Максимальная 85-минутная проработка тела у топ-мастера студии: глубокое снятие хронических мышечных блоков, коррекция силуэта и полное обновление организма.', 
        6500, 85, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/gallery-interior-art.jpg', 7, true, now()
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
        '30000000-0000-4000-8000-000000000008', v_tenant_id, '20000000-0000-4000-8000-000000000003', 'Мужской силовой / спортивный массаж (55 мин)', 
        'Интенсивный оздоровительный массаж для мужчин: глубокая проработка мышц спины, плечевого пояса, шеи и ног. Снимает напряжение после зала, спорта и сидячей работы.', 
        4000, 55, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/gallery-massage-process.jpg', 8, true, now()
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
        '30000000-0000-4000-8000-000000000009', v_tenant_id, '20000000-0000-4000-8000-000000000003', 'Мужской силовой / спортивный массаж (85 мин)', 
        'Полуторачасовой профессиональный сеанс, сочетающий техники глубокотканного спортивного и восстанавливающего массажа. Повышает выносливость, эластичность мышц и снимает зажимы.', 
        5500, 85, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/gallery-room-bamboo.jpg', 9, true, now()
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
        '30000000-0000-4000-8000-000000000010', v_tenant_id, '20000000-0000-4000-8000-000000000003', 'Мужской массаж 55 мин — Топ-мастер', 
        'Глубокая спортивная и триггерная миофасциальная проработка у топ-мастера студии.', 
        5000, 55, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/gallery-room-1.jpg', 10, true, now()
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
        '30000000-0000-4000-8000-000000000011', v_tenant_id, '20000000-0000-4000-8000-000000000003', 'Мужской массаж 85 мин — Топ-мастер', 
        'Расширенный 85-минутный сеанс силовой реабилитации и спортивного восстановления у топ-мастера студии.', 
        7000, 85, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/gallery-massage-process.jpg', 11, true, now()
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
        '30000000-0000-4000-8000-000000000012', v_tenant_id, '20000000-0000-4000-8000-000000000004', 'Массаж лица 30 мин (Лимфодренажный / Классический)', 
        'Снимает утреннюю и хроническую отёчность, расслабляет мимические зажимы, улучшает микроциркуляцию и возвращает коже здоровое сияние.', 
        2500, 30, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-face-massage.jpg', 12, true, now()
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
        '30000000-0000-4000-8000-000000000013', v_tenant_id, '20000000-0000-4000-8000-000000000004', 'Массаж лица 50 мин (Скульптурирующий лифтинг)', 
        'Глубокая проработка мышечного каркаса лица, шеи и зоны декольте. Чёткий овал лица, разглаживание носогубных складок и выраженный естественный лифтинг-эффект.', 
        3000, 50, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-face-massage.jpg', 13, true, now()
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
        '30000000-0000-4000-8000-000000000014', v_tenant_id, '20000000-0000-4000-8000-000000000004', 'Массаж лица 30 мин — Топ-мастер', 
        'Авторский экспресс-лифтинг и лимфодренаж лица от топ-мастера косметолога-эстетиста.', 
        3500, 30, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-face-massage.jpg', 14, true, now()
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
        '30000000-0000-4000-8000-000000000015', v_tenant_id, '20000000-0000-4000-8000-000000000004', 'Массаж лица 50 мин — Топ-мастер', 
        'Полная 50-минутная скульптурно-миофасциальная пластика лица, шеи, декольте и апоневроза головы у топ-мастера студии.', 
        4000, 50, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-face-massage.jpg', 15, true, now()
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
        '30000000-0000-4000-8000-000000000016', v_tenant_id, '20000000-0000-4000-8000-000000000005', 'Массаж головы и шейно-воротниковой зоны (30 мин)', 
        'Усиливает приток кислорода, снимает стрессовую нагрузку, мигрени и усталость от экранов, улучшает сон и стимулирует рост волос.', 
        1500, 30, 10, 'UNIVERSAL', 
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
        '30000000-0000-4000-8000-000000000017', v_tenant_id, '20000000-0000-4000-8000-000000000005', 'Рефлекторный массаж стоп и голеней (30 мин)', 
        'Снятие тяжести и усталости в ногах, проработка биологически активных точек стопы, уменьшение вечерних отёков и глубокое расслабление.', 
        1500, 30, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-spa-wrap.jpg', 17, true, now()
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
        '30000000-0000-4000-8000-000000000018', v_tenant_id, '20000000-0000-4000-8000-000000000005', 'SPA-обёртывание Aravia или Morizo (30 мин)', 
        'Профессиональные составы Aravia и Morizo выводят лишнюю жидкость, ускоряют клеточный метаболизм, уменьшают проявления целлюлита и делают кожу бархатной.', 
        1500, 30, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/service-spa-wrap.jpg', 18, true, now()
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
        '30000000-0000-4000-8000-000000000019', v_tenant_id, '20000000-0000-4000-8000-000000000006', 'Абонемент: 5 сеансов массажа тела (55 мин)', 
        'Курс из 5 сеансов общего, лимфодренажного или антицеллюлитного массажа тела по выгодной цене (2 200 ₽ за сеанс). Оформление и первый сеанс в день визита.', 
        11000, 55, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/gallery-price-body.jpg', 19, true, now()
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
        '30000000-0000-4000-8000-000000000020', v_tenant_id, '20000000-0000-4000-8000-000000000006', 'Абонемент: 10 сеансов массажа тела (55 мин)', 
        'Полный курс из 10 сеансов массажа тела по 55 минут для стойкого оздоровления спины или коррекции фигуры (2 100 ₽ за сеанс).', 
        21000, 55, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/gallery-price-body.jpg', 20, true, now()
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
        '30000000-0000-4000-8000-000000000021', v_tenant_id, '20000000-0000-4000-8000-000000000006', 'Абонемент: 5 сеансов массажа лица (30 мин)', 
        'Курс из 5 процедур лимфодренажного и тонизирующего массажа лица по 30 минут для стойкого снятия отёков и свежести кожи.', 
        11000, 30, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/gallery-price-face.jpg', 21, true, now()
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
        '30000000-0000-4000-8000-000000000022', v_tenant_id, '20000000-0000-4000-8000-000000000006', 'Абонемент: 5 сеансов массажа лица (50 мин)', 
        'Интенсивный курс скульптурирующего лифтинг-массажа лица, шеи и декольте — 5 сеансов по 50 минут (2 700 ₽ за сеанс).', 
        13500, 50, 10, 'UNIVERSAL', 
        '/tenants/na-massazh/images/gallery-price-face.jpg', 22, true, now()
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
        'Вакуумные банки к сеансу (+15 мин)', 'Локальная вакуумно-баночная проработка проблемных зон или триггерных точек спины', 
        500, 15, 0, 1, true
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, description = EXCLUDED.description, price = EXCLUDED.price,
        duration_min = EXCLUDED.duration_min, buffer_after_min = EXCLUDED.buffer_after_min,
        display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_options (
        id, tenant_id, service_id, name, description, price, duration_min, buffer_after_min, display_order, is_active
    ) VALUES (
        '40000000-0000-4000-8000-000000000002', v_tenant_id, NULL, 
        'Вакуумные банки — глубокая проработка (+30 мин)', 'Расширенная 30-минутная вакуумно-баночная терапия для мощного лимфодренажа', 
        1000, 30, 0, 2, true
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, description = EXCLUDED.description, price = EXCLUDED.price,
        duration_min = EXCLUDED.duration_min, buffer_after_min = EXCLUDED.buffer_after_min,
        display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_options (
        id, tenant_id, service_id, name, description, price, duration_min, buffer_after_min, display_order, is_active
    ) VALUES (
        '40000000-0000-4000-8000-000000000003', v_tenant_id, NULL, 
        'Массаж на профессиональном уходовом креме', 'Использование увлажняющего и питательного SPA-крема вместо базового массажного масла', 
        500, 0, 0, 3, true
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, description = EXCLUDED.description, price = EXCLUDED.price,
        duration_min = EXCLUDED.duration_min, buffer_after_min = EXCLUDED.buffer_after_min,
        display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_options (
        id, tenant_id, service_id, name, description, price, duration_min, buffer_after_min, display_order, is_active
    ) VALUES (
        '40000000-0000-4000-8000-000000000004', v_tenant_id, NULL, 
        'Крем-ингибитор жира (вместо базового масла)', 'Интенсивный липолитический состав для усиления эффекта антицеллюлитного массажа', 
        1500, 0, 0, 4, true
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, description = EXCLUDED.description, price = EXCLUDED.price,
        duration_min = EXCLUDED.duration_min, buffer_after_min = EXCLUDED.buffer_after_min,
        display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_options (
        id, tenant_id, service_id, name, description, price, duration_min, buffer_after_min, display_order, is_active
    ) VALUES (
        '40000000-0000-4000-8000-000000000005', v_tenant_id, NULL, 
        'SPA-обёртывание Aravia или Morizo (+30 мин)', 'Лимфодренажное и моделирующее обёртывание профессиональными составами Aravia / Morizo', 
        1500, 30, 0, 5, true
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, description = EXCLUDED.description, price = EXCLUDED.price,
        duration_min = EXCLUDED.duration_min, buffer_after_min = EXCLUDED.buffer_after_min,
        display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_options (
        id, tenant_id, service_id, name, description, price, duration_min, buffer_after_min, display_order, is_active
    ) VALUES (
        '40000000-0000-4000-8000-000000000006', v_tenant_id, NULL, 
        'Массаж головы (+15 мин к сеансу)', 'Расслабляющая проработка кожи головы и затылочной зоны', 
        750, 15, 0, 6, true
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, description = EXCLUDED.description, price = EXCLUDED.price,
        duration_min = EXCLUDED.duration_min, buffer_after_min = EXCLUDED.buffer_after_min,
        display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;
    INSERT INTO service_options (
        id, tenant_id, service_id, name, description, price, duration_min, buffer_after_min, display_order, is_active
    ) VALUES (
        '40000000-0000-4000-8000-000000000007', v_tenant_id, NULL, 
        'Массаж стоп (+15 мин к сеансу)', 'Рефлекторная проработка стоп для снятия усталости и тяжести в ногах', 
        750, 15, 0, 7, true
    )
    ON CONFLICT (tenant_id, id) DO UPDATE SET
        name = EXCLUDED.name, description = EXCLUDED.description, price = EXCLUDED.price,
        duration_min = EXCLUDED.duration_min, buffer_after_min = EXCLUDED.buffer_after_min,
        display_order = EXCLUDED.display_order, is_active = EXCLUDED.is_active;

    -- 7. Upsert Masters
    INSERT INTO masters (
        id, tenant_id, name, title, bio, avatar_url, rating, reviews_count, display_order, is_active
    ) VALUES (
        '50000000-0000-4000-8000-000000000001', v_tenant_id, 'Елена', 'Топ-мастер по массажу тела и реабилитации', 
        'Медицинское образование, опыт более 8 лет. Деликатная и глубокая проработка спины, шейно-воротниковой зоны и триггерных точек, силовой и спортивный массаж без боли и синяков.', 
        '/tenants/na-massazh/images/master-elena.jpg', 
        5, 74, 1, true
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
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000009') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000010') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000011') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000016') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000017') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000019') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', '30000000-0000-4000-8000-000000000020') ON CONFLICT DO NOTHING;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', 0, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', 1, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', 2, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', 3, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', 4, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', 5, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000001', 6, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO masters (
        id, tenant_id, name, title, bio, avatar_url, rating, reviews_count, display_order, is_active
    ) VALUES (
        '50000000-0000-4000-8000-000000000002', v_tenant_id, 'Зара', 'Топ-мастер коррекции фигуры и лимфодренажа', 
        'Опыт 6 лет. Эксперт по антицеллюлитному, скульптурирующему и лимфодренажному массажу тела, вакуумным банкам и обёртываниям Aravia/Morizo — выраженный результат без синяков.', 
        '/tenants/na-massazh/images/master-zara.jpg', 
        5, 52, 2, true
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
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000006') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000007') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000008') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000009') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000010') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000011') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000017') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000018') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000019') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000020') ON CONFLICT DO NOTHING;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', 0, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', 1, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', 2, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', 3, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', 4, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', 5, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000002', 6, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO masters (
        id, tenant_id, name, title, bio, avatar_url, rating, reviews_count, display_order, is_active
    ) VALUES (
        '50000000-0000-4000-8000-000000000003', v_tenant_id, 'Гуля', 'Топ-мастер по массажу и скульптурированию лица', 
        'Косметолог-эстетист с опытом 7 лет. Авторские техники миофасциального, лимфодренажного и пластического лифтинг-массажа лица, шеи, зоны декольте и головы.', 
        '/tenants/na-massazh/images/master-gulya.jpg', 
        4.99, 38, 3, true
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
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', '30000000-0000-4000-8000-000000000012') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', '30000000-0000-4000-8000-000000000013') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', '30000000-0000-4000-8000-000000000014') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', '30000000-0000-4000-8000-000000000015') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', '30000000-0000-4000-8000-000000000016') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', '30000000-0000-4000-8000-000000000018') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', '30000000-0000-4000-8000-000000000021') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', '30000000-0000-4000-8000-000000000022') ON CONFLICT DO NOTHING;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', 0, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', 1, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', 2, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', 3, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', 4, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', 5, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000003', 6, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO masters (
        id, tenant_id, name, title, bio, avatar_url, rating, reviews_count, display_order, is_active
    ) VALUES (
        '50000000-0000-4000-8000-000000000004', v_tenant_id, 'Алла', 'Мастер классического и SPA-массажа', 
        'Опыт 5 лет. Классический оздоровительный и расслабляющий массаж тела, деликатный массаж для беременных, рефлекторный массаж стоп и комплексные SPA-уходы.', 
        '/tenants/na-massazh/images/master-alla.jpg', 
        4.98, 34, 4, true
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
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000012') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000013') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000016') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000017') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000018') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000019') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000020') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000021') ON CONFLICT DO NOTHING;
    INSERT INTO master_services (tenant_id, master_id, service_id)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', '30000000-0000-4000-8000-000000000022') ON CONFLICT DO NOTHING;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', 0, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', 1, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', 2, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', 3, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', 4, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', 5, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;
    INSERT INTO master_schedules (tenant_id, master_id, day_of_week, start_time, end_time, is_day_off)
    VALUES (v_tenant_id, '50000000-0000-4000-8000-000000000004', 6, '10:00', '22:00', false)
    ON CONFLICT (tenant_id, master_id, day_of_week) DO UPDATE SET
        start_time = EXCLUDED.start_time, end_time = EXCLUDED.end_time, is_day_off = EXCLUDED.is_day_off;

    RAISE NOTICE 'Tenant "%" published successfully.', 'na-massazh';
END $$;