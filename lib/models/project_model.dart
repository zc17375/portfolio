class ProjectsModel {
  final List<String> image;
  final String title;
  final String subtitle;
  final List<String> skill;
  final String? demo;
  final String? repo;

  ProjectsModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.skill,
    this.demo,
    this.repo,
  });
}

// HOBBY PROJECTS
List<ProjectsModel> Projects = [
  ProjectsModel(
    image: [
      'assets/img/project1/1.png',
      'assets/img/project1/2.png',
      'assets/img/project1/3.png',
    ],
    title: 'Golang Backend Project',
    subtitle:
        '使用Golang gin框架 + GORM + Mysql & MongoDB 實現 Restful API 並使用dockerfile & compose 容器化．提高前後端分離開發的協作效率，降低開發成本，同時提高API 的可維護性和可擴充性。',
    skill: ['golang', 'jwt', 'gorm', 'mysql', 'mongodb', 'swagger', 'docker'],
    demo: '',
    repo: 'https://github.com/zc17375/e-portfolio-server',
  ),
  ProjectsModel(
    image: [
      'assets/img/project2/1.jpg',
      'assets/img/project2/2.jpg',
      'assets/img/project2/3.jpg'
    ],
    title: 'flutter web Project',
    subtitle:
        '使用Flutter 3.16版本，利用1~2週時間快速學習並實作一個“個人作品集網站”，且實現響應式網站，相同程式碼同時生成web與app提升跨平台效率．使用Github Actions CI/CD to Netlify自動部署．',
    skill: ['flutter', 'dart'],
    demo: 'https://ed-portfolios.netlify.app/',
    repo: 'https://github.com/zc17375/portfolio',
  ),
  ProjectsModel(
    image: [
      'assets/img/project3/1.jpg',
      'assets/img/project3/2.jpg',
    ],
    title: 'JoinIt電商平台',
    subtitle:
        '使用php laravel + Eloquent ORM 開發電商平台，負責後端RESTful API設計和開發系統的核心功能。主要開發功能:用戶註冊、oAuth2.0、商品系統、訂單系統、金流服務、發票系統..等核心功能。',
    skill: ['php', 'laravel', 'orm', 'mysql', 'swagger'],
    demo: '',
    repo: '',
  ),
  // ProjectsModel(
  //   image: ['img/projects/project1.png'],
  //   title: 'English Learning App',
  //   subtitle:
  //       'This is a comprehensive English learning app for practicing and competing with each other.',
  //   skill: [],
  //   demo: '',
  //   repo: '',
  // ),
];
