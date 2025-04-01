import 'package:flutter/material.dart';
import 'package:welcome_comp/infra/ui/components/help_section.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

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
                  "Primeiro, tente reinstalar o app. Se o problema persistir, você pode reportá-lo no GitHub oficial do Welcome Comp. Caso prefira, também pode entrar em contato com o pessoal do DACOMP ou comigo (Mikael Cauã).\n\nAh, e como o código é aberto, sinta-se à vontade para contribuir com melhorias e novas funcionalidades!",
            ),
            HelpSection(
              title: "Créditos",
              description:
                  "O Welcome Comp teve como base o repositório de provas Awesome UFMA, atualmente mantido pelo DACOMP.\n\nO Welcome Comp foi desenvolvido pelo discente Mikael Cauã. Caso tenha dúvidas ou sugestões, fique à vontade para entrar em contato, beleza? :)\n\nAbração e até mais!",
            ),
          ],
        ),
      ),
    );
  }
}
