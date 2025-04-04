import 'package:flutter/material.dart';
import 'package:welcome_comp/infra/ui/components/help_section.dart';
import 'package:welcome_comp/infra/ui/components/social_media_button.dart';
import 'package:welcome_comp/infra/viewmodels/help_screen_view_model.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({
    super.key,
    required this.helpScreenViewModel,
  });

  final HelpScreenViewModel helpScreenViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
        child: Column(
          spacing: 30,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HelpSection(
              title: "O que é o Welcome Comp?",
              description:
                  "O Welcome Comp é um app criado para reunir conteúdos das disciplinas do curso de Ciência da Computação da Universidade Federal do Maranhão. A ideia principal é oferecer um jeito simples e rápido de acessar provas anteriores.\n\nAs provas ficam armazenadas offline, então, com ou sem internet, bastam dois cliques para ter qualquer prova do curso na palma da mão!",
            ),
            HelpSection(
              title: "Ocorreu algum erro?",
              description:
                  "Primeiro, tente reinstalar o app. Se o problema persistir, você pode reportá-lo no GitHub oficial do Welcome Comp.\n\nAh, e como o código é aberto, sinta-se à vontade para contribuir com melhorias e novas funcionalidades!",
            ),
            HelpSection(
              title: "Créditos",
              description:
                  "O Welcome Comp, desenvolvido pelo estudante Mikael Cauã, foi inspirado no repositório de provas Awesome UFMA, atualmente mantido pelo DACOMP.\n\nSe tiver dúvidas ou sugestões, sinta-se à vontade para entrar em contato! :)",
              buttons: [
                SocialMediaButton(
                  icon: Icons.business,
                  color: Color(0xFF0077B5),
                  onPressed: helpScreenViewModel.openSite,
                  url: 'https://www.linkedin.com/in/mikael-cau%C3%A3-silva/',
                  label: 'LinkedIn Mikael Cauã',
                ),
                SocialMediaButton(
                  icon: Icons.camera_alt_outlined,
                  color: Color.fromRGBO(214, 41, 119,1),
                  onPressed: helpScreenViewModel.openSite,
                  url: 'https://www.instagram.com/dacomp.ufma/',
                  label: 'Instagram DACOMP',
                ),
                SocialMediaButton(
                  icon: Icons.code,
                  color: Color(0xFF333333),
                  onPressed: helpScreenViewModel.openSite,
                  url: 'https://github.com/mikaelcaua/welcome_comp',
                  label: 'GitHub Welcome Comp',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
