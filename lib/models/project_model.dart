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
      'img/project1/1.png',
      'img/project1/2.png',
      'img/project1/3.png',
    ],
    title: 'Golang Backend Project',
    subtitle:
        '使用Golang gin框架 + GORM + Mysql & MongoDB 實現 Restful API 並使用dockerfile & compose 容器化．提高前後端分離開發的協作效率，降低開發成本，同時提高API 的可維護性和可擴充性。',
    skill: ['golang', 'jwt', 'gorm', 'mysql', 'mongodb', 'swagger', 'docker'],
    demo: '',
    repo: 'https://github.com/zc17375/e-portfolio-server',
  ),
  ProjectsModel(
    image: ['img/project2/1.jpg', 'img/project2/2.jpg', 'img/project2/3.jpg'],
    title: 'flutter web Project',
    subtitle:
        '使用Flutter 3.16版本，利用一週時間快速學習並實作一個“個人作品集網站”，且實現響應式網站，相同程式碼同時生成web與app提升跨平台效率．',
    skill: ['flutter', 'dart'],
    demo: '',
    repo: 'https://github.com/zc17375/portfolio',
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
