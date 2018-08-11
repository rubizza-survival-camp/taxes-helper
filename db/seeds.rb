# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(email: 'test@mail.ru', password: '123456', password_confirmation: '123456')
User.create(email: 'yourname@yourcompany.com', password: '111111', password_confirmation: '111111')
User.create(email: 'user2@mail2.com', password: '111111', password_confirmation: '111111')

OrganizationForm.create(name: 'Физическое лицо (самозанятость)')
OrganizationForm.create(name: 'Индивидуальный Предприниматель')
OrganizationForm.create(name: 'Частное предприятие')
OrganizationForm.create(name: 'OOO')

TaxationForm.create(name:                       'Единый налог',
                    organization_form:          OrganizationForm.first,
                    period_type:                'month',
                    declaration_period_in_days: 1)
TaxationForm.create(name:                       'УСН',
                    organization_form:          OrganizationForm.second,
                    period_type:                'quarter',
                    declaration_period_in_days: 22)

# Organization.create(name:              'Rubizza',
#                     user:              User.first,
#                     organization_form: OrganizationForm.first,
#                     taxation_form:     TaxationForm.first)

Organization.create(name: 'Rubizza', user_id: 1, organization_form_id: 3, taxation_form_id: 2)
Organization.create(name: 'Organization1', user_id: 2, organization_form_id: 4, taxation_form_id: 2)
Organization.create(name: 'Ivanov Ivan Ivanovich', user_id: 2, organization_form_id: 2, taxation_form_id: 1)

ActivityType.create(name: 'Деятельность1')
ActivityType.create(name: 'Деятельность2')
ActivityType.create(name: 'Деятельность3')
ActivityType.create(name: 'Деятельность4')
ActivityType.create(name: 'Деятельность5')

Taxes::CalculationForms::FixedRate.create(rate: 109.22, taxation_form_id: 1, activity_type_id: 1)
Taxes::CalculationForms::FixedRate.create(rate: 155.00, taxation_form_id: 1, activity_type_id: 1)
Taxes::CalculationForms::FixedRate.create(rate: 193.67, taxation_form_id: 1, activity_type_id: 1)
Taxes::CalculationForms::PercentFromReceipt.create(rate: 5.0, taxation_form_id: 2, activity_type_id: 2)
Taxes::CalculationForms::PercentFromReceipt.create(rate: 3.0, taxation_form_id: 2, activity_type_id: 3)
Taxes::CalculationForms::PercentFromSales.create(rate: 20.0, taxation_form_id: 2, activity_type_id: 4)
