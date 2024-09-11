object FormularioMenu: TFormularioMenu
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Menu'
  ClientHeight = 295
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  TextHeight = 13
  object pnlCorpo: TPanel
    Left = 0
    Top = 0
    Width = 516
    Height = 295
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 512
    ExplicitHeight = 294
    DesignSize = (
      516
      295)
    object pnlHeader: TPanel
      AlignWithMargins = True
      Left = 24
      Top = 75
      Width = 423
      Height = 110
      Margins.Left = 25
      Margins.Right = 52
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      Color = clWhite
      Padding.Left = 50
      Padding.Right = 50
      TabOrder = 0
      StyleElements = []
      ExplicitWidth = 419
      DesignSize = (
        423
        110)
      object lblCepCadastrados: TLabel
        Left = 244
        Top = 55
        Width = 143
        Height = 70
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        Caption = 'CEP Cadastrados'
        Color = clMoneyGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = 7229229
        Font.Height = -16
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        OnClick = lblCepCadastradosClick
      end
      object lblConsulta: TLabel
        Left = 88
        Top = 48
        Width = 150
        Height = 78
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        Caption = 'Consulta'
        Color = clMoneyGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = 7229229
        Font.Height = -16
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        OnClick = lblConsultaClick
      end
      object shpBarra: TShape
        Left = 128
        Top = 104
        Width = 74
        Height = 4
        Anchors = [akLeft]
        Brush.Color = 8490063
        Pen.Style = psClear
        Shape = stRoundRect
        Visible = False
      end
      object imgImportacao: TImage
        Left = 274
        Top = 8
        Width = 79
        Height = 73
        Cursor = crHandPoint
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000400000
          004908060000008D6620160000000970485973000002170000021701652E6556
          0000001974455874536F667477617265007777772E696E6B73636170652E6F72
          679BEE3C1A00000A074944415478DAED9C79B05C5511C69B252141205193284B
          4200592451C144D152342EB8AFE0EE1F2E20AEA54829ABA5C5A2821B50A20568
          41B0B470018520AEB15470891A16890651A1923C146411948042D067FFE8EECC
          993377E6DE9977DFBBF31E76D5576FE66EEF9EBE7DFAF4D7DD77B6907A651BC5
          1E8A058A5D14F315BBFAE7D98A6DFD98ED155BFB36E42EC5038ABB15F729EEF5
          6D3729D62B46FCF306C50D7E4C2DB2C51807FB78C592048B15D36A566A2E9B14
          6B145726B85671FF4428E0918A172B5EAE78BEE26103FCCF51B1A7CB4036FAB6
          ED5C71B307B827E41EC5F7142B149729EEA85301DCDC1B14AF571CA8D8AAC7B1
          98294F674382F5FEF79F8EFF94FC3FAEBF8383A9B4506C2A2D7060753BF7389F
          EB5FA1B840F11557CE400A7894E268C55B15B3BA68FDA78AD58EDF286EA9AAF9
          31CA8E8AA58E27299E29E65F72F987E28B8A4F286EADAA00E6F6B18A0F48A789
          7391158E958A7F4DD080CB64A6E2B96253F3A58A79D97EA6DA2715A748E62B72
          053C41CC741E9B6DFF91E234C57715FF6D7AB425B2A5E2458AF72B9E9DEDFBBD
          D8545E53A4004EFA9AD89C47465D1998CF6F9B1ED580B29FD8347E6D325696DA
          D78839CDCD1B716E3F50CCF0EF7F56BC59F1F3A647509330BEE58ADDFD3B53F7
          20C6870278E26BC53CADB8225E2DE6B1A792B0AA5C24E62B1056A64528E018C5
          C77DE3AF15CF901A23AD21132C9C2572A97F3F1A055CAFD8CB37ECAFB8A6E9BB
          1C6779A258F488FC0105E0D5F97B9FB47CC054977F8B2DF7A30C7CD43712414D
          4BBE4F55619924167830A24D1580BC527171D37738CE72B0983394220510CA3E
          452C7E9F8AB29B6295249162AE0084E5014BB8AAE9BBAD59A0EBDF92D672DFA1
          00E86970791CE2498A4FC9E45F1271EC1F547C4831DDB7DD1F9F5305FCC907BB
          3839799DE274C5B96221E46412B24E872A8E10CB4A855CEB4AD92B570044E1A9
          8A4F2B0E93769E00AD3C4771BE1F37CCB248F126C5E1D24EE3477D0CB0DC557E
          5C8702E2E92F539CAA7872C13F80275C224689E10A65098EF11696B3A72B5E26
          4687F728388601438A2EF7EFBF2B5340C84B14EF533C478A7307F06C9C652444
          C00DE33CE0C7482B1102885EB72B388E7141E399C29765FB2A2B20641F311E8D
          96F72BB94132BA91061B71AC1323571B7D3FBE8669B5C9CFC1F962AE4467DBFA
          80202F0BA5950E9BEFDF6796FCFFABC5AC132A7F7D9763FA56402ABBBA22C8BC
          1CE037DAA4A0584CFC521FF8860AE78C4901A91056EE296692911AC75AE6F579
          9DAA424AEE3A694F89B37AF59BA5AA4D01DD846506934D8B232C4B9839E68E89
          CF9416F9829C90A4608A302DEEF2CF695164C48FAB43C65D01C32E850A40DB0B
          9BBEB31A855AC63BC532C1F92AC05817E40AC0BCCA3CEC300A71C00BC596DFEB
          92ED4C1B0A28A4FB1665E730DD66E40AC091304FEF6D7A447DCA718A8F8A156A
          487A460184F5FFBD8A8F89F180106A1DAC1C5BE60A40C80F9EDAF488BA080FE7
          3B8A396211DF1F7DFBC98AE3C59C2774F72FC939109EBC687AAC2B458A14C0C1
          AF102B800C9B10955EEA9F79EA91C865DABE45CCB15D5E720D0ABB50E2CD15EC
          A27C004A3852F1B9A6479C0916F055B1A5F510314E525518E77BC4E8FDF47C47
          288075378DA989A399436B9B1EF9180507F859C5B3926D9BC79A2A8081FE4ACC
          9C42708CCCBB33C48AA1934960883C40728069499F9239046ADF5C011108BD51
          CC83CEC92E08E35B2E360FABC4DB4D086B3B3C857CC0D26CDF6D62CC1692541A
          09D2097294D8BC29AABB4381211EDF172BA4D415A2F62BACE53CCDE789AD0CFB
          171CC3F278A658793C3A472A87C2909AB729DE21E67C8A247A76C805AC965687
          C82D525F8D81FB7CB4D8137E9CB47201BD7A920884CE527C413A9B23FAE602CC
          216A869175D9ADC24DC3F9231F8042EE94F63C00C148580E4F720769CF0B3C42
          5AB9805D7C5B99DC28AD060E96C46ED9AA319321FA745897C921428177AC785E
          DD72B31825FEA5986F5A53F1BCDAD9E0CED2CA07D05DC213E3C961B65B0D78CD
          109E22D3092BC2ACD74A2B17F0D701AF3961749866C89DC44C391A2589C50946
          66F97E842649A60641184E2B1A25477C900FD47C5FFFCF071429E06F62263B55
          84A52FF201C767FB18EBBC5C0193B53F60AE188BA5E2737EB21D56C8F42347B0
          6F760E63ED288DF117677673D323EA21F8119C6ADA0A4BFBDE11FE99E5799D7F
          2623F42EB12EB715C9F18C71C4C7DEC106BF2416460EA3B0AAB0CCF1E45E20D6
          A58ABC5D2CE0C1ACF71673A6BDE4CB62E1BE142900A12AFCE1A6475B2054A782
          90F1C4CF48F6EDE30AB8B3E41A648E8E4B37142900B950ACB85876C18914EE15
          6736C7FFDED3C7B9701B0AA307175D3414005B9A9BECE33B96709E4CDE1E019C
          3AF4FE446967B770838E55803800C6F4796967809816D9A1B35C29934178902C
          81EF96F62A1501163E8355A36B2044F5F56CE96C3426954C7E3D5E4AF87BD3A3
          CC04F2142F73D0F79CA7F8C97031AD214C95224172ED2788D1CE5C084DE9B8A4
          AD96EE52E2F232EF5BB7104A93F4A087817C40B79739B8BF8F883747BBF4150A
          3F4DCC94D06C517244FC1AA4A9C90710900405A602435C31681305038269525B
          8C12394C9487B2A7747FE10353A7DD8FA9FB8B82FD037101064F87353901A870
          D50A30DC1F3677ABB4DE134A7B0490BC37609A5F9FC16F5DF1FF70FD2891AF94
          DE059E319321AA2AF413463E6049C913A95BC2E28216930F20A15BB54C3E2E6C
          908C0E8DC8C4DD51160FB325FC9CDEE7F5A0C63749EBDDC1289113DB93931C4B
          3B7F237438F8FF2C57067981F0D4696F00D322F203E3250F897C00BE841582F6
          99DC1F3C2414F013B1D7E9BE2DD6CFD45501981EE6C81C9B5FFDFA43233860DE
          0DE4C52EDE710C4748EF10411D71C001D939D13BB01105E050A2A08013BBBAE9
          11F510A2D3872BBE292DCB256A3DDC3FF354A39649FDE0556249921B3385ADF6
          CF57A2003A284FF10D1437C8FF3755E9E9254BFCFEB86708CE72DF8E99F3BA1F
          16407CB2A9C73570BA57F8B590A3E2AD31E6FF02DFB8D23537D1A16D99B0BC12
          65121DF2DEDF37FA3C9FD507CB098EB34EB1380217C2DD1F4A6B59C264D07259
          C3C1440B81174C6F459FE72D13A3F50BFD3BAB0209965569E4469AE9EB628D08
          C8A87FA7656698FD422FC1A7417DB1E8182B0114EF4542E43A425796C10BA473
          39FCB1E23362AD334D7787970953043A4C97CBB26C1F39C5D749D2F45114BB13
          A5E118298FE75DD824448270306586A5A30C1205250EA23637DBCFCB1E6487B1
          E63627D98BBCCC7525F0F2C4EC82FD0CFE6762EB6CB4CB0F5AABEB5758C3D396
          797201453D8E94D7C80592E9BABDE84255D81B4152FA0B12BDE8290AC05347AB
          FC7A69F5FB72332432CB7EEB2378024A8F5F8D201F10E48A7CC04E3DCE8F644D
          FC82444F2BED97BE9276627EC56F886CDFE7F921F11B22F11E12D789DF101944
          B84EFC86083D4D95D37563E1EF58028588F45764F0BAE3DD6ECB134E73018029
          3850F056770203F3E59D9D68958F7C00C07A66B882D212399297C6C91651FE8A
          DF0E8A4E13BED31FB8A9D2DD5490FF011CA97DCF0F25152B0000000049454E44
          AE426082}
        OnClick = lblCepCadastradosClick
      end
      object imgConsulta: TImage
        Left = 128
        Top = 8
        Width = 71
        Height = 65
        Cursor = crHandPoint
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000400000
          00400806000000AA6971DE0000000473424954080808087C0864880000000970
          485973000001D8000001D801FA5CA6720000001974455874536F667477617265
          007777772E696E6B73636170652E6F72679BEE3C1A000007274944415478DADD
          9B7BB055531CC77F51A451067944EE5CA9A944DE212521AFF1FE2386BC4A33CD
          C8E0127925F2682A45FEF07EC4908CC74C5EA9249518A4226F42A584BCCAF59C
          F87D66EDCD3AEBEC7DCEDEE7AC7DCE3DF737F39DB9FBB7F6D96BAFEF5EEBF75A
          EBB690F2651BC5618A4314DD15BB29B6536CA9F847B141F1ADE233C5078A058A
          798A9F3DF45DB6B428F177AD150315672BFA2B3649F9FBBF1533150F2B9E51FC
          592B04B4515CA06850ECE8E91D5628C62BEEA90611690838413159519FD1BB7C
          2486DC394D8D802D14B72B8616B8A751F19AE20DC5878A358AF541DB568A9D15
          DD14BD15078959425182CD98A418A9F8AB2910D041F18262EF98F6598AFB14D3
          15BF27EC13E3784A4068DF987B309427297EA826019D8201768A689BAB18A178
          BBCCFE216082A257441B1EE328C5D7D520802FBF2062F0B8B40B1553C44C571F
          820761ED8F93FCA5F17E40D28F95248035BF50F2A7FD278A13151F27786E47C5
          C562BCC63762BEE2EB62BE6A9CD01F4B6917474FCC708418D75911027047AEC1
          5BA2385A4C4093E4997CB9EE116D9F2A9E1263E8A29EC5E059765D1DFD58C595
          95200057373DE2A5FB241C3CB2B514375E788809011A9DB63A311EA5A3A5DBA8
          3834D0674600539F2FB7ABA5FB55718018D7964678D1DE09EE5B2CC6DAAF74F4
          FB8BB1419B5BBA658A7DC5B37BB409C0AA8F73DACF533C54C273DB06BFED2266
          5AEF25F1011436E278C522474FB479ABA31BA278200B02B0BE9F2B76B2DAE62B
          FA893F6B0F09C303623675DA089C7085AB2C1DF7BCA5D8C7D2F18E0454DE0C62
          480049CD14A7AD57F002BEA587E209C5EE8E9E1980ADB1032A0CEF0CE73EECD4
          73BE09982DC6D588753D2083C187D24E4C1678B8A3BF42F29721C1D67ED635E4
          9DE69300F2F9EF2437A53D5D312D4302421288377A58BA9F149D15EB2CDD30C5
          9DD67563F0CE7FF822E05431BED9EEA0BDE2B78C094058DF7C619BFC518A31D6
          F5B68AB5926B37A841CCF5450096B6C1D2653DFD5D794431C8BA5E22B9864F24
          7F195CABB8D11701647BC75A3AD81F554102307CF31D1D39C817D6F51D623C48
          288F29CEF44500915E674BC7D778B4820430FD7183DB177887E10109A1E09D7A
          157F743202BE17B3CE42F1B6BE52C89CA0DF50462BAEB7AE4F16E33542211EE8
          5CFCB1C908C09A6E66E908431795F6B892C5B503B7292EB1AE8F14932485425E
          B243560410FB975BE8482B647A375BD76E3C80519E991501C400ED2D1DC1C92B
          152680BA2153BC5FD037AEF917ABDD75D518C84E899F5E8400AAB176FE7D8E98
          7A7D35A4A544C7F917895916A1507C3DD81701CF8AC9C642B945715595088813
          22C161D6351E625089CFCA2380B536C2D2BD2A66ABAB29C952454FEB1A9B31D6
          17016E1508A3884DD850ED5107C20ED46AC9AD5D602BE6F9220003442CD0D2D2
          57D30EB842717592758D712468F2960C21CF2B8EB3F494A3FAA67F9C77E1FDDE
          55EC61E9A62ACEF0D901427EFDB8D3E66D9A9521EC203DEDE8D82C9955C2B30A
          124020444E5067B5116FB38FB7B14A83A7208AF1B35D342E9B4A92AF325D8E61
          71130E04FF3BB94A048C565CE7E898FA537D766213C02C80F16E968EFA1CE5ED
          C5151E3CCBEF65C92D82909F90017A9D91EEC60861F06C47BF2A206165D28796
          294C798CB01D9E131D1EA878C77767515B63ECD65CEAE8D8172421595181C193
          F4D4397AB74C962901ADC4E4E77D1C3D1B9CE4E559658A4CFB2725F7CB23EC08
          B1A7104E7D8C2345D1355911204107B8C01E8E9E333CE4099C18F1B539C18008
          6DAF91FC0D935008D5EF524C549C2BE6237D25263F9851BC8BF40420EC12BD24
          B9414828142E4706EDE5F4CDBE20317DD704F77F29F9DB6BCC8AC192BFA9E385
          00849DDE304F8F122CF3FD62362BD6493221B627F03A5FA2C94596156873A52C
          12921C922247B8414C9526EE3C202F81ABB40F4985050D720DB6BAC343527B16
          E8976585B1A3E44DA97E7CD624A43926C7CB9397F74CF19B34828B1B2AFFBB3A
          7698C903EA9DFBD824616F70880F12D21E9464369C25C66875F13470C25B66D8
          34C90D72A24EAA307862158EDA303B2E8B2081DDE7C4996CA94765B1D6C70464
          504F6893F2F72C0F32D007C5045E6E6CDF3AB8A755CCE0917601791DCA21A154
          026CC18D913411378487A5C9D7DB06ED1C87A18ABB5CF19E98D3236F4AE17C9E
          41AD76741C8C08A73D83C7FDC5D5051393E08380AC84CA6FBDA3234A1D5364F0
          A94868CA04B0C45826AEE7C1C3B8D37E6D70EFE0B42434650210CE29B06BD4B2
          C03D2C2F0E77103BDC24F915ED82DEA1A913508C047BF0A1A422A116084038C3
          84C77097836D186D8973917924D40A0148DC4CA062DC10717FA299504B046442
          42AD11E09D845A240089B309C4092322EE8FB309FD6B958052481817A15F58CB
          049442C28B6202AC50D6D73A016948A00073B773DFD2E6400052CC3062F0EE8D
          206960732100899B09D42D0744E83993747573220049923B207885CBF9A3B911
          908484FF06DF5C09284442CEE09B330108073C38F045117779F077DEBF00FC0B
          5412876AF5D0891A0000000049454E44AE426082}
        OnClick = lblConsultaClick
      end
    end
  end
end
