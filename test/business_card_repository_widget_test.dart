import 'package:digital_business/src/model/card_model.dart';
import 'package:digital_business/src/repository/business_card_repository.dart';
import 'package:digital_business/src/versions/app_version.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

class MockBusinessCardRepository extends Mock
    implements BusinessCardRepository {}

void main() {
  //Linkedin ---------------------------------------------- TESTES
  testWidgets('test do bielzera', (tester) async {
    await mockNetworkImages(() async {
      final repository = MockBusinessCardRepository();
      // Simular resposta da API
      when(() => repository.getUser()).thenAnswer((_) async => CardModel(
          linkedin: '',
          id: 'id',
          name: 'name',
          jobArea: 'jobArea',
          email: 'email',
          picture: 'picture',
          about: 'about',
          interest: 'interest',
          instagram: 'instagram',
          github: 'github',
          facebook: 'facebook',
          twitter: 'twitter'));

      // Carregar tela UserProfile
      await tester.pumpWidget(MaterialApp(
        home: UserProfile(
          repository: repository,
        ),
      ));

      // expect(find.byType(CircularProgressIndicator), findsOne);

      // Espera carregar os dados mockados (sair do loading)
      await tester.pump();

      //Verificar se botão do twitter está visível
      expect(find.byKey(const ValueKey('linkedin-button')), findsNothing);
    });
  });
  testWidgets(
      'quando a api NÃO retorna o link, o botão do GitHub NÃO é apresentado na tela',
      (tester) async {
    await mockNetworkImages(() async {
      final repository = MockBusinessCardRepository();
      // Simular resposta da API
      when(() => repository.getUser()).thenAnswer((_) async => CardModel(
          linkedin: '',
          id: 'id',
          name: 'name',
          jobArea: 'jobArea',
          email: 'email',
          picture: 'picture',
          about: 'about',
          interest: 'interest',
          instagram: 'instagram',
          github: 'github',
          facebook: 'facebook',
          twitter: 'twitter'));

      // Carregar tela UserProfile
      await tester.pumpWidget(MaterialApp(
        home: UserProfile(repository: repository),
      ));

      // expect(find.byType(CircularProgressIndicator), findsOne);

      // Espera carregar os dados mockados (sair do loading)
      await tester.pump();

      //Verificar se botão do twitter está visível
      expect(find.byKey(const ValueKey('linkedin-button')), findsNothing);
    });
  });

  testWidgets(
      'quando a api retorna o link, o botão do linkedin é apresentado na tela',
      (tester) async {
    await mockNetworkImages(() async {
      final repository = MockBusinessCardRepository();
      // Simular resposta da API
      when(() => repository.getUser()).thenAnswer((_) async => CardModel(
          linkedin: 'linkedin',
          id: 'id',
          name: 'name',
          jobArea: 'jobArea',
          email: 'email',
          picture: 'picture',
          about: 'about',
          interest: 'interest',
          instagram: 'instagram',
          github: 'github',
          facebook: 'facebook',
          twitter: 'twitter'));

      // Carregar tela UserProfile
      await tester.pumpWidget(MaterialApp(
        home: UserProfile(repository: repository),
      ));

      // expect(find.byType(CircularProgressIndicator), findsOne);

      // Espera carregar os dados mockados (sair do loading)
      await tester.pump();

      //Verificar se botão do twitter está visível
      expect(find.byKey(const ValueKey('linkedin-button')), findsOne);
    });
  });

  testWidgets('quando clicar no botão do linkedin, abre a URL', (tester) async {
    await mockNetworkImages(() async {
      final repository = MockBusinessCardRepository();
      // Simular resposta da API
      when(() => repository.getUser()).thenAnswer((_) async => CardModel(
          linkedin:
              'https://www.linkedin.com/in/gabriel-charamello-inacio-9538b3227',
          id: 'id',
          name: 'name',
          jobArea: 'jobArea',
          email: 'email',
          picture: 'picture',
          about: 'about',
          interest: 'interest',
          instagram: 'instagram',
          github: 'github',
          facebook: 'facebook',
          twitter: 'twitter'));

      when(() => repository.launchLink(any())).thenAnswer((_) async {});

      // Carregar tela UserProfile
      await tester.pumpWidget(MaterialApp(
        home: UserProfile(repository: repository),
      ));

      // Espera carregar os dados mockados (sair do loading)
      await tester.pump();

      // Aperta o botão do twitter
      await tester.tap(find.byKey(const ValueKey('linkedin-button')));

      // Verifica se abriu a url
      verify(() => repository.launchLink(
              'https://www.linkedin.com/in/gabriel-charamello-inacio-9538b3227'))
          .called(1);
    });
  });

  //GitHub ---------------------------------------------- TESTES

  testWidgets(
      'quando a api NÃO retorna o link, o botão do GitHub NÃO é apresentado na tela',
      (tester) async {
    await mockNetworkImages(() async {
      final repository = MockBusinessCardRepository();
      // Simular resposta da API
      when(() => repository.getUser()).thenAnswer((_) async => CardModel(
          linkedin: '',
          id: 'id',
          name: 'name',
          jobArea: 'jobArea',
          email: 'email',
          picture: 'picture',
          about: 'about',
          interest: 'interest',
          instagram: 'instagram',
          github: '',
          facebook: 'facebook',
          twitter: 'twitter'));

      // Carregar tela UserProfile
      await tester.pumpWidget(MaterialApp(
        home: UserProfile(repository: repository),
      ));

      // expect(find.byType(CircularProgressIndicator), findsOne);

      // Espera carregar os dados mockados (sair do loading)
      await tester.pump();

      //Verificar se botão do twitter está visível
      expect(find.byKey(const ValueKey('github-button')), findsNothing);
    });
  });
  testWidgets(
      'quando a api retorna o link, o botão do GitHub é apresentado na tela',
      (tester) async {
    await mockNetworkImages(() async {
      final repository = MockBusinessCardRepository();
      // Simular resposta da API
      when(() => repository.getUser()).thenAnswer((_) async => CardModel(
          linkedin: '',
          id: '0',
          name: 'name',
          jobArea: 'jobArea',
          email: 'email',
          picture: 'picture',
          about: 'about',
          interest: 'interest',
          instagram: 'instagram',
          github: 'https://github.com/bielpdev',
          facebook: 'facebook',
          twitter: 'twitter'));

      // Carregar tela UserProfile
      await tester.pumpWidget(MaterialApp(
        home: UserProfile(repository: repository),
      ));

      // expect(find.byType(CircularProgressIndicator), findsOne);

      // Espera carregar os dados mockados (sair do loading)
      await tester.pump();

      //Verificar se botão do twitter está visível
      expect(find.byKey(const ValueKey('github-button')), findsOne);
    });
  });

  testWidgets('quando clicar no botão do GitHub, abre a URL', (tester) async {
    await mockNetworkImages(() async {
      final repository = MockBusinessCardRepository();
      // Simular resposta da API
      when(() => repository.getUser()).thenAnswer((_) async => CardModel(
          linkedin: '',
          id: '0',
          name: 'name',
          jobArea: 'jobArea',
          email: 'email',
          picture: 'picture',
          about: 'about',
          interest: 'interest',
          instagram: 'instagram',
          github: 'https://github.com/bielpdev',
          facebook: 'facebook',
          twitter: 'twitter'));

      when(() => repository.launchLink(any())).thenAnswer((_) async {});

      // Carregar tela UserProfile
      await tester.pumpWidget(MaterialApp(
        home: UserProfile(repository: repository),
      ));

      // Espera carregar os dados mockados (sair do loading)
      await tester.pump();

      // Aperta o botão do twitter
      await tester.tap(find.byKey(const ValueKey('github-button')));

      // Verifica se abriu a url
      verify(() => repository.launchLink('https://github.com/bielpdev'))
          .called(1);
    });
  });

  //------------------------------------------------------------------------

  //Instagram ---------------------------------------------- TESTES

  testWidgets(
      'quando a api NÃO retorna o link, o botão do instagram NÃO é apresentado na tela',
      (tester) async {
    await mockNetworkImages(() async {
      final repository = MockBusinessCardRepository();
      // Simular resposta da API
      when(() => repository.getUser()).thenAnswer((_) async => CardModel(
          linkedin: '',
          id: '',
          name: 'name',
          jobArea: 'jobArea',
          email: 'email',
          picture: 'picture',
          about: 'about',
          interest: 'interest',
          instagram: 'instagram',
          github: 'github',
          facebook: '',
          twitter: 'twitter'));

      // Carregar tela UserProfile
      await tester.pumpWidget(MaterialApp(
        home: UserProfile(repository: repository),
      ));

      // expect(find.byType(CircularProgressIndicator), findsOne);

      // Espera carregar os dados mockados (sair do loading)
      await tester.pump();

      //Verificar se botão do twitter está visível
      expect(find.byKey(const ValueKey('facebook-button')), findsNothing);
    });
  });
  testWidgets(
      'quando a api retorna o link, o botão do instagram é apresentado na tela',
      (tester) async {
    await mockNetworkImages(() async {
      final repository = MockBusinessCardRepository();
      // Simular resposta da API
      when(() => repository.getUser()).thenAnswer((_) async => CardModel(
          linkedin: '',
          id: '0',
          name: 'name',
          jobArea: 'jobArea',
          email: 'email',
          picture: 'picture',
          about: 'about',
          interest: 'interest',
          instagram: 'instagram',
          github: 'github',
          facebook: 'https://www.facebook.com/gabriel.chavosk/',
          twitter: 'twitter'));

      // Carregar tela UserProfile
      await tester.pumpWidget(MaterialApp(
        home: UserProfile(repository: repository),
      ));

      // expect(find.byType(CircularProgressIndicator), findsOne);

      // Espera carregar os dados mockados (sair do loading)
      await tester.pump();

      //Verificar se botão do twitter está visível
      expect(find.byKey(const ValueKey('facebook-button')), findsOne);
    });
  });

  testWidgets('quando clicar no botão do Instagram, abre a URL',
      (tester) async {
    await mockNetworkImages(() async {
      final repository = MockBusinessCardRepository();
      // Simular resposta da API
      when(() => repository.getUser()).thenAnswer((_) async => CardModel(
          linkedin: '',
          id: '0',
          name: 'name',
          jobArea: 'jobArea',
          email: 'email',
          picture: 'picture',
          about: 'about',
          interest: 'interest',
          instagram: 'https://www.instagram.com/gaahinacio',
          github: 'github',
          facebook: 'facebook',
          twitter: 'twitter'));

      when(() => repository.launchLink(any())).thenAnswer((_) async {});

      // Carregar tela UserProfile
      await tester.pumpWidget(MaterialApp(
        home: UserProfile(repository: repository),
      ));

      // Espera carregar os dados mockados (sair do loading)
      await tester.pump();

      // Aperta o botão do twitter
      await tester.tap(find.byKey(const ValueKey('instagram-button')));

      // Verifica se abriu a url
      verify(() =>
              repository.launchLink('https://www.instagram.com/gaahinacio'))
          .called(1);
    });
  });

  //------------------------------------------------------------------------

  //FACEBOOK ---------------------------------------------- URL

  testWidgets('quando clicar no botão do Facebook, abre a URL', (tester) async {
    await mockNetworkImages(() async {
      final repository = MockBusinessCardRepository();
      // Simular resposta da API
      when(() => repository.getUser()).thenAnswer((_) async => CardModel(
          linkedin: '',
          id: '0',
          name: 'name',
          jobArea: 'jobArea',
          email: 'email',
          picture: 'picture',
          about: 'about',
          interest: 'interest',
          instagram: 'instagram',
          github: 'github',
          facebook: 'https://www.facebook.com/gabriel.chavosk/',
          twitter: 'twitter'));

      when(() => repository.launchLink(any())).thenAnswer((_) async {});

      // Carregar tela UserProfile
      await tester.pumpWidget(MaterialApp(
        home: UserProfile(repository: repository),
      ));

      // Espera carregar os dados mockados (sair do loading)
      await tester.pump();

      // Aperta o botão do twitter
      await tester.tap(find.byKey(const ValueKey('facebook-button')));

      // Verifica se abriu a url
      verify(() => repository
          .launchLink('https://www.facebook.com/gabriel.chavosk/')).called(1);
    });
  });

  testWidgets(
      'quando a api retorna o link, o botão do facebook é apresentado na tela',
      (tester) async {
    await mockNetworkImages(() async {
      final repository = MockBusinessCardRepository();
      // Simular resposta da API
      when(() => repository.getUser()).thenAnswer((_) async => CardModel(
          linkedin: '',
          id: '0',
          name: 'name',
          jobArea: 'jobArea',
          email: 'email',
          picture: 'picture',
          about: 'about',
          interest: 'interest',
          instagram: 'instagram',
          github: 'github',
          facebook: 'https://www.facebook.com/gabriel.chavosk/',
          twitter: 'twitter'));

      // Carregar tela UserProfile
      await tester.pumpWidget(MaterialApp(
        home: UserProfile(repository: repository),
      ));

      // expect(find.byType(CircularProgressIndicator), findsOne);

      // Espera carregar os dados mockados (sair do loading)
      await tester.pump();

      //Verificar se botão do twitter está visível
      expect(find.byKey(const ValueKey('facebook-button')), findsOne);
    });
  });

  testWidgets(
      'quando a api NÃO retorna o link, o botão do facebook NÃO é apresentado na tela',
      (tester) async {
    await mockNetworkImages(() async {
      final repository = MockBusinessCardRepository();
      // Simular resposta da API
      when(() => repository.getUser()).thenAnswer((_) async => CardModel(
          linkedin: '',
          id: '0',
          name: 'name',
          jobArea: 'jobArea',
          email: 'email',
          picture: 'picture',
          about: 'about',
          interest: 'interest',
          instagram: 'instagram',
          github: 'github',
          facebook: '',
          twitter: 'twitter'));

      await tester.pumpWidget(MaterialApp(
        home: UserProfile(repository: repository),
      ));

      await tester.pump();

      expect(find.byKey(const ValueKey('facebook-button')), findsNothing);
    });
  });

  //------------------------------------------------------------------------

  //TWITTER ---------------------------------------------- TESTES

  testWidgets('quando clicar no botão do twitter, abre a URL', (tester) async {
    await mockNetworkImages(() async {
      final repository = MockBusinessCardRepository();
      // Simular resposta da API
      when(() => repository.getUser()).thenAnswer((_) async => CardModel(
          linkedin: '',
          id: '0',
          name: 'name',
          jobArea: 'jobArea',
          email: 'email',
          picture: 'picture',
          about: 'about',
          interest: 'interest',
          instagram: 'instagram',
          github: 'GitHub',
          facebook: 'facebook',
          twitter: 'https://x.com/'));

      when(() => repository.launchLink(any())).thenAnswer((_) async {});

      // Carregar tela UserProfile
      await tester.pumpWidget(MaterialApp(
        home: UserProfile(repository: repository),
      ));

      // Espera carregar os dados mockados (sair do loading)
      await tester.pump();

      // Aperta o botão do twitter
      await tester.tap(find.byKey(const ValueKey('twitter-button')));

      // Verifica se abriu a url
      verify(() => repository.launchLink('https://x.com/')).called(1);
    });
  });

  testWidgets(
      'quando a api retorna o link Twitter, o botão do Twitter é apresentado na tela',
      (tester) async {
    await mockNetworkImages(() async {
      final repository = MockBusinessCardRepository();
      // Simular resposta da API
      when(() => repository.getUser()).thenAnswer((_) async => CardModel(
          linkedin: '',
          id: '0',
          name: 'name',
          jobArea: 'jobArea',
          email: 'email',
          picture: 'picture',
          about: 'about',
          interest: 'interest',
          instagram: 'instagram',
          github: 'github',
          facebook: 'facebook',
          twitter: 'x.com'));

      // Carregar tela UserProfile
      await tester.pumpWidget(MaterialApp(
        home: UserProfile(repository: repository),
      ));

      // expect(find.byType(CircularProgressIndicator), findsOne);

      // Espera carregar os dados mockados (sair do loading)
      await tester.pump();

      //Verificar se botão do twitter está visível
      expect(find.byKey(const ValueKey('twitter-button')), findsOne);
    });
  });

  testWidgets(
      'quando a api NÃO retorna o link Twitter, o botão do Twitter NÃO é apresentado na tela',
      (tester) async {
    await mockNetworkImages(() async {
      final repository = MockBusinessCardRepository();
      // Simular resposta da API
      when(() => repository.getUser()).thenAnswer((_) async => CardModel(
          linkedin: '',
          id: '0',
          name: 'name',
          jobArea: 'jobArea',
          email: 'email',
          picture: 'picture',
          about: 'about',
          interest: 'interest',
          instagram: 'instagram',
          github: 'github',
          facebook: 'facebook',
          twitter: ''));

      // Carregar tela UserProfile
      await tester.pumpWidget(MaterialApp(
        home: UserProfile(repository: repository),
      ));

      // expect(find.byType(CircularProgressIndicator), findsOne);

      // Espera carregar os dados mockados (sair do loading)
      await tester.pump();

      //Verificar se botão do twitter está visível
      expect(find.byKey(const ValueKey('twitter-button')), findsNothing);
    });
  });

  //----------------------------------------------------------------------------

  //--------------------------------REPOSITORY----------------------------------

  testWidgets('quando o repository retorna um erro, mostra o erro na tela',
      (tester) async {
    final mockedException = Exception('Erro mockado (apenas teste)');
    await mockNetworkImages(() async {
      final repository = MockBusinessCardRepository();
      // Simular resposta da API
      when(() => repository.getUser())
          .thenAnswer((_) async => throw mockedException);

      // Carregar tela UserProfile
      await tester.pumpWidget(MaterialApp(
        home: UserProfile(repository: repository),
      ));

      // expect(find.byType(CircularProgressIndicator), findsOne);

      // Espera carregar os dados mockados (sair do loading)
      await tester.pump();

      //Verificar se o erro é mostrado na tela
      expect(find.textContaining('$mockedException'), findsOne);
    });
  });
}
