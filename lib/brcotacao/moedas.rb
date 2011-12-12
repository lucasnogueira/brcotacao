# ecoding: utf-8
module BrCotacao
 
  module Moeda

    FONTE_INFORMACAO = 'http://www4.bcb.gov.br/Download/fechamento/'.freeze
    POSICAO_CODIGO_MOEDA = 1
    POSICAO_VALOR_COMPRA = 4
    POSICAO_VALOR_VENDA  = 5

    def compra(data_pesquisa)
      cotacao_encontrada = cotacao(data_pesquisa)

      cotacao_encontrada.nil? ? nil : cotacao_encontrada[:compra]
    end

    def venda(data_pesquisa)
      cotacao_encontrada = cotacao(data_pesquisa)

      cotacao_encontrada.nil? ? nil : cotacao_encontrada[:venda]
    end

    def cotacao(data_pesquisa)
      cotacoes_moeda = dados_cotacoes(data_pesquisa).detect{|dado| dado.first.eql? @dados.codigo}

      cotacoes_moeda.nil? ? nil : {:compra => cotacoes_moeda[1].gsub(',', '.').to_f, :venda => cotacoes_moeda[2].gsub(',', '.').to_f}
    end
  
    private 
    def dados_cotacoes(data_pesquisa)
      begin
        arquivo_baixar       = data_pesquisa.strftime("%Y%m%d.csv")
        endereco             = URI.parse(FONTE_INFORMACAO + arquivo_baixar)
        conexao              = Net::HTTP.new(endereco.host)
        cotacoes             = conexao.get(endereco.path)
        raise BrCotacao::Errors::CotacaoNaoEncontradaError.new(data_pesquisa) unless cotacoes.msg.eql? 'OK'
        dados_brutos   = cotacoes.body
        
        dados_brutos.lines.map do |linha|
          dados_linha = linha.split(';')

          [dados_linha[POSICAO_CODIGO_MOEDA], dados_linha[POSICAO_VALOR_COMPRA], dados_linha[POSICAO_VALOR_VENDA]]
        end
      rescue SocketError => e
        raise BrCotacao::Errors::ConexaoMalSucedidaError.new
      rescue Exception => e
        raise e
      end
    end    
 
  end

  class AfeganeAfeganist

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::AFEGANE_AFEGANIST
    end

  end

  class RandeAfricaSul

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::RANDE_AFRICA_SUL
    end

  end

  class LekAlbaniaRep

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::LEK_ALBANIA_REP
    end

  end

  class KwanzaAngola

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::KWANZA_ANGOLA
    end

  end

  class GuilderAntilhas

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::GUILDER_ANTILHAS
    end

  end

  class RialArabSaudita

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::RIAL_ARAB_SAUDITA
    end

  end

  class DinarArgelino

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DINAR_ARGELINO
    end

  end

  class PesoArgentina

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::PESO_ARGENTINA
    end

  end

  class DramArmeniaRep

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DRAM_ARMENIA_REP
    end

  end

  class FlorimAruba

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::FLORIM_ARUBA
    end

  end

  class DolarAustraliano

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_AUSTRALIANO
    end

  end

  class ManatArzebaijao

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::MANAT_ARZEBAIJAO
    end

  end

  class DolarBahamas

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_BAHAMAS
    end

  end

  class DinarBahrein

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DINAR_BAHREIN
    end

  end

  class TacaBangladesh

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::TACA_BANGLADESH
    end

  end

  class DolarBarbados

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_BARBADOS
    end

  end

  class RubloBelarus

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::RUBLO_BELARUS
    end

  end

  class DolarBelize

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_BELIZE
    end

  end

  class DolarBermudas

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_BERMUDAS
    end

  end

  class BolivianoBolivia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::BOLIVIANO_BOLIVIA
    end

  end

  class MarcoConvBosnia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::MARCO_CONV_BOSNIA
    end

  end

  class PulaBotswana

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::PULA_BOTSWANA
    end

  end

  class RealBrasil

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::REAL_BRASIL
    end

  end

  class DolarBrunei

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_BRUNEI
    end

  end

  class LevBulgariaRep

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::LEV_BULGARIA_REP
    end

  end

  class FrancoBurundi

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::FRANCO_BURUNDI
    end

  end

  class NgultrumButao

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::NGULTRUM_BUTAO
    end

  end

  class EscudoCaboVerde

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::ESCUDO_CABO_VERDE
    end

  end

  class RielCamboja

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::RIEL_CAMBOJA
    end

  end

  class DolarCanadense

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_CANADENSE
    end

  end

  class RialCatar

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::RIAL_CATAR
    end

  end

  class DolarCayman

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_CAYMAN
    end

  end

  class TengeCazaquistao

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::TENGE_CAZAQUISTAO
    end

  end

  class UnidFomentoChil

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::UNID_FOMENTO_CHIL
    end

  end

  class PesoChile

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::PESO_CHILE
    end

  end

  class IuanRenmimbiChi

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::IUAN_RENMIMBI_CHI
    end

  end

  class DolarCingapura

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_CINGAPURA
    end

  end

  class PesoColombia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::PESO_COLOMBIA
    end

  end

  class FrancoComores

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::FRANCO_COMORES
    end

  end

  class FrancoCongoles

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::FRANCO_CONGOLES
    end

  end

  class WonCoreiaNorte

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::WON_COREIA_NORTE
    end

  end

  class WonCoreiaSul

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::WON_COREIA_SUL
    end

  end

  class ColonCostaRica

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::COLON_COSTA_RICA
    end

  end

  class DinarKwait

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DINAR_KWAIT
    end

  end

  class KunaCroacia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::KUNA_CROACIA
    end

  end

  class PesoCuba

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::PESO_CUBA
    end

  end

  class CoroaDinamDinam

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::COROA_DINAM_DINAM
    end

  end

  class FrancoDjibuti

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::FRANCO_DJIBUTI
    end

  end

  class LibraEgito

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::LIBRA_EGITO
    end

  end

  class ColonElSalvador

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::COLON_EL_SALVADOR
    end

  end

  class DirhamEmirArabe

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DIRHAM_EMIR_ARABE
    end

  end

  class DolarDosEua

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_DOS_EUA
    end

  end

  class BirrEtiopia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::BIRR_ETIOPIA
    end

  end

  class LibraFalkland

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::LIBRA_FALKLAND
    end

  end

  class DolarFiji

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_FIJI
    end

  end

  class PesoFilipinas

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::PESO_FILIPINAS
    end

  end

  class NovoDolarTaiwan

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::NOVO_DOLAR_TAIWAN
    end

  end

  class DalasiGambia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DALASI_GAMBIA
    end

  end

  class CediGana

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::CEDI_GANA
    end

  end

  class LariGeorgia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::LARI_GEORGIA
    end

  end

  class LibraGibraltar

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::LIBRA_GIBRALTAR
    end

  end

  class QuetzalGuatemala

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::QUETZAL_GUATEMALA
    end

  end

  class DolarDaGuiana

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_DA_GUIANA
    end

  end

  class FrancoGuine

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::FRANCO_GUINE
    end

  end

  class PesoGuineBissau

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::PESO_GUINE_BISSAU
    end

  end

  class GourdeHaiti

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::GOURDE_HAITI
    end

  end

  class LempiraHonduras

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::LEMPIRA_HONDURAS
    end

  end

  class DolarHongKong

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_HONG_KONG
    end

  end

  class ForintHungria

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::FORINT_HUNGRIA
    end

  end

  class RialIemen

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::RIAL_IEMEN
    end

  end

  class RupiaIndia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::RUPIA_INDIA
    end

  end

  class RupiaIndonesia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::RUPIA_INDONESIA
    end

  end

  class RialIranRep

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::RIAL_IRAN_REP
    end

  end

  class DinarIraque

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DINAR_IRAQUE
    end

  end

  class CoroaIslndIslan

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::COROA_ISLND_ISLAN
    end

  end

  class ShekelIsrael

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::SHEKEL_ISRAEL
    end

  end

  class DolarJamaica

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_JAMAICA
    end

  end

  class Iene

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::IENE
    end

  end

  class DinarJordania

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DINAR_JORDANIA
    end

  end

  class QuipeLaosRep

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::QUIPE_LAOS_REP
    end

  end

  class LotiLesoto

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::LOTI_LESOTO
    end

  end

  class LatLetoniaRep

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::LAT_LETONIA_REP
    end

  end

  class LibraLibano

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::LIBRA_LIBANO
    end

  end

  class DolarLiberia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_LIBERIA
    end

  end

  class DinarLibia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DINAR_LIBIA
    end

  end

  class LitaLituania

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::LITA_LITUANIA
    end

  end

  class PatacaMacau

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::PATACA_MACAU
    end

  end

  class DinarMacedonia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DINAR_MACEDONIA
    end

  end

  class AriaryMadagascar

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::ARIARY_MADAGASCAR
    end

  end

  class RinggitMalasia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::RINGGIT_MALASIA
    end

  end

  class QuachaMalavi

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::QUACHA_MALAVI
    end

  end

  class RufiaMaldivas

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::RUFIA_MALDIVAS
    end

  end

  class DirhamMarrocos

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DIRHAM_MARROCOS
    end

  end

  class RupiaMauricio

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::RUPIA_MAURICIO
    end

  end

  class NakfaEritreia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::NAKFA_ERITREIA
    end

  end

  class PesoMexico

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::PESO_MEXICO
    end

  end

  class QuiateBirmania

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::QUIATE_BIRMANIA
    end

  end

  class NovaMeticalMoca

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::NOVA_METICAL_MOCA
    end

  end

  class LeuMoldaviaRep

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::LEU_MOLDAVIA_REP
    end

  end

  class TugrikMongolia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::TUGRIK_MONGOLIA
    end

  end

  class DolarDaNamibia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_DA_NAMIBIA
    end

  end

  class RupiaNepal

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::RUPIA_NEPAL
    end

  end

  class CordobaOuro

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::CORDOBA_OURO
    end

  end

  class NairaNigeria

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::NAIRA_NIGERIA
    end

  end

  class CoroaNorueNorue

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::COROA_NORUE_NORUE
    end

  end

  class DolarNovaZeland

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_NOVA_ZELAND
    end

  end

  class RialOma

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::RIAL_OMA
    end

  end

  class BalboaPanama

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::BALBOA_PANAMA
    end

  end

  class KinaPapuaNGuin

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::KINA_PAPUA_N_GUIN
    end

  end

  class RupiaPaquistao

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::RUPIA_PAQUISTAO
    end

  end

  class GuaraniParaguai

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::GUARANI_PARAGUAI
    end

  end

  class NovoSolPeru

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::NOVO_SOL_PERU
    end

  end

  class FrancoCfp

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::FRANCO_CFP
    end

  end

  class ZlotyPolonia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::ZLOTY_POLONIA
    end

  end

  class XelimQuenia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::XELIM_QUENIA
    end

  end

  class SomQuirguistao

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::SOM_QUIRGUISTAO
    end

  end

  class LibraEsterlina

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::LIBRA_ESTERLINA
    end

  end

  class PesoRepDominic

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::PESO_REP_DOMINIC
    end

  end

  class NovoLeuRomenia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::NOVO_LEU_ROMENIA
    end

  end

  class FrancoRuanda

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::FRANCO_RUANDA
    end

  end

  class RubloRussia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::RUBLO_RUSSIA
    end

  end

  class DolarIlSalomao

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_IL_SALOMAO
    end

  end

  class TalaSamoaOc

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::TALA_SAMOA_OC
    end

  end

  class LibraStaHelena

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::LIBRA_STA_HELENA
    end

  end

  class LeoneSerraLeoa

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::LEONE_SERRA_LEOA
    end

  end

  class DinarServioServ

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DINAR_SERVIO_SERV
    end

  end

  class RupiaSeycheles

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::RUPIA_SEYCHELES
    end

  end

  class LibraSiriaRep

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::LIBRA_SIRIA_REP
    end

  end

  class XelimSomalia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::XELIM_SOMALIA
    end

  end

  class RupiaSriLanka

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::RUPIA_SRI_LANKA
    end

  end

  class LilangeniSuazil

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::LILANGENI_SUAZIL
    end

  end

  class NovaLibraSudane

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::NOVA_LIBRA_SUDANE
    end

  end

  class CoroaSuecaSueci

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::COROA_SUECA_SUECI
    end

  end

  class FrancoSuico

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::FRANCO_SUICO
    end

  end

  class DolarSuriname

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_SURINAME
    end

  end

  class SomoniTadjiquist

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::SOMONI_TADJIQUIST
    end

  end

  class BathTailandia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::BATH_TAILANDIA
    end

  end

  class XelimTanzania

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::XELIM_TANZANIA
    end

  end

  class CoroaTcheca

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::COROA_TCHECA
    end

  end

  class PaangaTonga

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::PAANGA_TONGA
    end

  end

  class DolarTrinTobag

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_TRIN_TOBAG
    end

  end

  class DinarTunisia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DINAR_TUNISIA
    end

  end

  class NovoManatTurcom

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::NOVO_MANAT_TURCOM
    end

  end

  class NovaLiraTurquia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::NOVA_LIRA_TURQUIA
    end

  end

  class HyrvniaUcrania

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::HYRVNIA_UCRANIA
    end

  end

  class XelimUganda

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::XELIM_UGANDA
    end

  end

  class PesoUruguaio

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::PESO_URUGUAIO
    end

  end

  class SomUzbequistao

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::SOM_UZBEQUISTAO
    end

  end

  class VatuVanuatu

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::VATU_VANUATU
    end

  end

  class BolivarForteVen

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::BOLIVAR_FORTE_VEN
    end

  end

  class DongueVietnan

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DONGUE_VIETNAN
    end

  end

  class QuachaZambia

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::QUACHA_ZAMBIA
    end

  end

  class DobraSTomePrin

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOBRA_S_TOME_PRIN
    end

  end

  class DolarZimbabue

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_ZIMBABUE
    end

  end

  class FrancoCfaBceao

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::FRANCO_CFA_BCEAO
    end

  end

  class DireitoEspecial

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DIREITO_ESPECIAL
    end

  end

  class DolarCaribeOrie

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_CARIBE_ORIE
    end

  end

  class FrancoCfaBeac

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::FRANCO_CFA_BEAC
    end

  end

  class Euro

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::EURO
    end

  end

  class UnidMonetEurop

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::UNID_MONET_EUROP
    end

  end

  class DolarOuro

    include Moeda

    def initialize
      @dados = OpenStruct.new Constantes::DOLAR_OURO
    end

  end


end