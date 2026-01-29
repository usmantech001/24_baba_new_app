import 'package:baba_24/data/model/currency_model.dart';
import 'package:baba_24/presentation/screens/dashboard/settings/languageCurrency/language_currency_screen.dart';


final List<Currency> ALL_WORLD_CURRENCIES = [
  // Middle East & North Africa
  Currency(code: 'AED', symbol: 'د.إ', label: 'UAE Dirham', country: 'United Arab Emirates', flag: '🇦🇪', region: 'Middle East'),
   Currency(code: 'SAR', symbol: 'ر.س', label: 'Saudi Riyal', country: 'Saudi Arabia', flag: '🇸🇦', region: 'Middle East'),
   Currency(code: 'EGP', symbol: '£', label: 'Egyptian Pound', country: 'Egypt', flag: '🇪🇬', region: 'Middle East'),
   Currency(code: 'QAR', symbol: 'ر.ق', label: 'Qatari Riyal', country: 'Qatar', flag: '🇶🇦', region: 'Middle East'),
   Currency(code: 'KWD', symbol: 'د.ك', label: 'Kuwaiti Dinar', country: 'Kuwait', flag: '🇰🇼', region: 'Middle East'),
   Currency(code: 'BHD', symbol: '.د.ب', label: 'Bahraini Dinar', country: 'Bahrain', flag: '🇧🇭', region: 'Middle East'),
   Currency(code: 'OMR', symbol: 'ر.ع.', label: 'Omani Rial', country: 'Oman', flag: '🇴🇲', region: 'Middle East'),
   Currency(code: 'JOD', symbol: 'د.ا', label: 'Jordanian Dinar', country: 'Jordan', flag: '🇯🇴', region: 'Middle East'),
   Currency(code: 'LBP', symbol: 'ل.ل', label: 'Lebanese Pound', country: 'Lebanon', flag: '🇱🇧', region: 'Middle East'),
   Currency(code: 'ILS', symbol: '₪', label: 'Israeli Shekel', country: 'Israel', flag: '🇮🇱', region: 'Middle East'),
  Currency(code: 'IRR', symbol: '﷼', label: 'Iranian Rial', country: 'Iran', flag: '🇮🇷', region: 'Middle East'),
   Currency(code: 'IQD', symbol: 'ع.د', label: 'Iraqi Dinar', country: 'Iraq', flag: '🇮🇶', region: 'Middle East'),
   Currency(code: 'YER', symbol: '﷼', label: 'Yemeni Rial', country: 'Yemen', flag: '🇾🇪', region: 'Middle East'),
   Currency(code: 'SYP', symbol: '£', label: 'Syrian Pound', country: 'Syria', flag: '🇸🇾', region: 'Middle East'),
   Currency(code: 'TND', symbol: 'د.ت', label: 'Tunisian Dinar', country: 'Tunisia', flag: '🇹🇳', region: 'Middle East'),
   Currency(code: 'DZD', symbol: 'د.ج', label: 'Algerian Dinar', country: 'Algeria', flag: '🇩🇿', region: 'Middle East'),
   Currency(code: 'MAD', symbol: 'د.م.', label: 'Moroccan Dirham', country: 'Morocco', flag: '🇲🇦', region: 'Middle East'),
   Currency(code: 'LYD', symbol: 'ل.د', label: 'Libyan Dinar', country: 'Libya', flag: '🇱🇾', region: 'Middle East'),

  // North America
   Currency(code: 'USD', symbol: '\$', label: 'US Dollar', country: 'United States', flag: '🇺🇸', region: 'North America'),
   Currency(code: 'CAD', symbol: '\$', label: 'Canadian Dollar', country: 'Canada', flag: '🇨🇦', region: 'North America'),
   Currency(code: 'MXN', symbol: '\$', label: 'Mexican Peso', country: 'Mexico', flag: '🇲🇽', region: 'North America'),

  // Europe
   Currency(code: 'EUR', symbol: '€', label: 'Euro', country: 'European Union', flag: '🇪🇺', region: 'Europe'),
   Currency(code: 'GBP', symbol: '£', label: 'British Pound', country: 'United Kingdom', flag: '🇬🇧', region: 'Europe'),
   Currency(code: 'CHF', symbol: 'Fr', label: 'Swiss Franc', country: 'Switzerland', flag: '🇨🇭', region: 'Europe'),
   Currency(code: 'SEK', symbol: 'kr', label: 'Swedish Krona', country: 'Sweden', flag: '🇸🇪', region: 'Europe'),
   Currency(code: 'NOK', symbol: 'kr', label: 'Norwegian Krone', country: 'Norway', flag: '🇳🇴', region: 'Europe'),
   Currency(code: 'DKK', symbol: 'kr', label: 'Danish Krone', country: 'Denmark', flag: '🇩🇰', region: 'Europe'),
   Currency(code: 'PLN', symbol: 'zł', label: 'Polish Zloty', country: 'Poland', flag: '🇵🇱', region: 'Europe'),
   Currency(code: 'CZK', symbol: 'Kč', label: 'Czech Koruna', country: 'Czech Republic', flag: '🇨🇿', region: 'Europe'),
   Currency(code: 'HUF', symbol: 'Ft', label: 'Hungarian Forint', country: 'Hungary', flag: '🇭🇺', region: 'Europe'),
   Currency(code: 'RON', symbol: 'lei', label: 'Romanian Leu', country: 'Romania', flag: '🇷🇴', region: 'Europe'),
   Currency(code: 'BGN', symbol: 'лв', label: 'Bulgarian Lev', country: 'Bulgaria', flag: '🇧🇬', region: 'Europe'),
   Currency(code: 'HRK', symbol: 'kn', label: 'Croatian Kuna', country: 'Croatia', flag: '🇭🇷', region: 'Europe'),
   Currency(code: 'RSD', symbol: 'дин.', label: 'Serbian Dinar', country: 'Serbia', flag: '🇷🇸', region: 'Europe'),
   Currency(code: 'RUB', symbol: '₽', label: 'Russian Ruble', country: 'Russia', flag: '🇷🇺', region: 'Europe'),
   Currency(code: 'TRY', symbol: '₺', label: 'Turkish Lira', country: 'Turkey', flag: '🇹🇷', region: 'Europe'),
   Currency(code: 'ISK', symbol: 'kr', label: 'Icelandic Krona', country: 'Iceland', flag: '🇮🇸', region: 'Europe'),
   Currency(code: 'UAH', symbol: '₴', label: 'Ukrainian Hryvnia', country: 'Ukraine', flag: '🇺🇦', region: 'Europe'),

  // Africa
   Currency(code: 'NGN', symbol: '₦', label: 'Nigerian Naira', country: 'Nigeria', flag: '🇳🇬', region: 'Africa'),
   Currency(code: 'ZAR', symbol: 'R', label: 'South African Rand', country: 'South Africa', flag: '🇿🇦', region: 'Africa'),
   Currency(code: 'GHS', symbol: '₵', label: 'Ghanaian Cedi', country: 'Ghana', flag: '🇬🇭', region: 'Africa'),
   Currency(code: 'KES', symbol: 'KSh', label: 'Kenyan Shilling', country: 'Kenya', flag: '🇰🇪', region: 'Africa'),

  // Asia
   Currency(code: 'JPY', symbol: '¥', label: 'Japanese Yen', country: 'Japan', flag: '🇯🇵', region: 'Asia Pacific'),
   Currency(code: 'CNY', symbol: '¥', label: 'Chinese Yuan', country: 'China', flag: '🇨🇳', region: 'Asia Pacific'),
   Currency(code: 'INR', symbol: '₹', label: 'Indian Rupee', country: 'India', flag: '🇮🇳', region: 'Asia Pacific'),
   Currency(code: 'AUD', symbol: '\$', label: 'Australian Dollar', country: 'Australia', flag: '🇦🇺', region: 'Asia Pacific'),
];
