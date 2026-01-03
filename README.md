Funcionalidades Principais
Sistema de Saldo (Coins): O jogador gerencia o saldo na própria conta do painel.

Loja Integrada: Permite comprar itens configurados que são entregues no inventário do personagem em cerca de 10 segundos.

Doação via PIX (Mercado Pago): Integração nativa com a API do Mercado Pago para aprovação automática de saldo.

Painel do Personagem: Visualização de status (Level, PvP, PK, Classe, Status Online/Offline).

Ranking Top 10: Rankings de PvP e PK atualizados em tempo real.

Segurança: Login com ReCaptcha e senhas criptografadas (padrão SHA-1/Base64).



 

O que você precisa configurar?
Para colocar o painel para rodar no seu servidor, você precisará ajustar alguns arquivos:

1. Conexão com o Banco de Dados (db.php)
Abra o arquivo db.php e insira as credenciais do seu banco de dados MySQL:
 

$host = '127.0.0.1';
$user = 'root';
$pass = 'SUA_SENHA';
$db   = 'NOME_DO_SEU_BANCO';
 


Configurações Gerais (config.php)
Este arquivo é o "coração" do painel. Você deve definir:

Mercado Pago: Seu ACCESS_TOKEN para receber os pagamentos.

Moeda do Jogo: O nome da variável de saldo no banco (ex: PRIME_POINTS).

ReCaptcha: Suas chaves do Google para proteger o cadastro.

Preços: O valor de cada coin em Reais.

3. Estrutura do Banco de Dados
O painel utiliza algumas tabelas que podem não ser padrão no seu emulador. Você precisará criar (ou adaptar):

donations: Para registrar as transações de PIX.

site_shop_history: Para o histórico de compras.

account_gsdata: (Ou similar) Onde o saldo dos jogadores fica armazenado.

4. Customização Visual (style.css)
O design é moderno e utiliza o tema roxo/escuro. Você pode alterar as cores e o fundo facilmente editando as variáveis de CSS no arquivo style.css.
