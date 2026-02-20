class AppStrings {
  static final Map<String, Map<String, String>> _values = {
    'English': {
      'brand': 'GOLDEN HOUR',
      'tagline': 'Immediate Emergency Guidance',
      'guide': 'Need urgent help?',
      'helpNow': 'HELP NOW',
      'decisionTitle': 'Emergency Decision',
      'decisionQuestion': 'What do you need right now?',
      'alert112': 'ALERT 112',
      'firstAid': 'START FIRST AID',
      'stayCalm': 'Stay calm. Follow instructions carefully.',
    },
    'Hindi': {
      'brand': 'गोल्डन ऑवर',
      'tagline': 'तुरंत आपात मार्गदर्शन',
      'guide': 'क्या तुरंत सहायता चाहिए?',
      'helpNow': 'अभी सहायता',
      'decisionTitle': 'आपात निर्णय',
      'decisionQuestion': 'आपको अभी क्या चाहिए?',
      'alert112': '112 पर कॉल करें',
      'firstAid': 'प्राथमिक उपचार शुरू करें',
      'stayCalm': 'शांत रहें। निर्देशों का पालन करें।',
    },
    'Telugu': {
      'brand': 'గోల్డెన్ అవర్',
      'tagline': 'తక్షణ అత్యవసర మార్గదర్శకం',
      'guide': 'తక్షణ సహాయం కావాలా?',
      'helpNow': 'ఇప్పుడు సహాయం',
      'decisionTitle': 'అత్యవసర నిర్ణయం',
      'decisionQuestion': 'మీకు ఇప్పుడే ఏమి కావాలి?',
      'alert112': '112 కి కాల్ చేయండి',
      'firstAid': 'ఫస్ట్ ఎయిడ్ ప్రారంభించండి',
      'stayCalm': 'శాంతంగా ఉండండి. సూచనలు అనుసరించండి.',
    },
  };

  static String get(String key, String language) {
    return _values[language]?[key] ?? _values['English']![key]!;
  }
}
