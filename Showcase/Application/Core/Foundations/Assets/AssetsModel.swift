//
//  Vitamin iOS
//  Apache License 2.0
//

import Foundation
import VitaminCore

enum AssetsModel {
    struct Section: Identifiable {
        var id: String {
            name
        }
        let name: String
        let items: [VitaminAsset]
    }

    static let sections = [
        AssetsModel.Section(name: "Flags", items: [
            VitaminAssets.Flag.ae,
            VitaminAssets.Flag.af,
            VitaminAssets.Flag.ag,
            VitaminAssets.Flag.ai,
            VitaminAssets.Flag.al,
            VitaminAssets.Flag.am,
            VitaminAssets.Flag.an,
            VitaminAssets.Flag.ao,
            VitaminAssets.Flag.ar,
            VitaminAssets.Flag.at,
            VitaminAssets.Flag.ad,
            VitaminAssets.Flag.au,
            VitaminAssets.Flag.aw,
            VitaminAssets.Flag.ax,
            VitaminAssets.Flag.az,
            VitaminAssets.Flag.ba,
            VitaminAssets.Flag.bb,
            VitaminAssets.Flag.bd,
            VitaminAssets.Flag.be,
            VitaminAssets.Flag.bf,
            VitaminAssets.Flag.bg,
            VitaminAssets.Flag.bh,
            VitaminAssets.Flag.bi,
            VitaminAssets.Flag.bj,
            VitaminAssets.Flag.bm,
            VitaminAssets.Flag.bn,
            VitaminAssets.Flag.bo,
            VitaminAssets.Flag.br,
            VitaminAssets.Flag.bs,
            VitaminAssets.Flag.bt,
            VitaminAssets.Flag.bw,
            VitaminAssets.Flag.by,
            VitaminAssets.Flag.bz,
            VitaminAssets.Flag.ca,
            VitaminAssets.Flag.caf,
            VitaminAssets.Flag.cas,
            VitaminAssets.Flag.cd,
            VitaminAssets.Flag.ceu,
            VitaminAssets.Flag.cf,
            VitaminAssets.Flag.cg,
            VitaminAssets.Flag.ch,
            VitaminAssets.Flag.ci,
            VitaminAssets.Flag.cl,
            VitaminAssets.Flag.cm,
            VitaminAssets.Flag.cn,
            VitaminAssets.Flag.cna,
            VitaminAssets.Flag.co,
            VitaminAssets.Flag.coc,
            VitaminAssets.Flag.cr,
            VitaminAssets.Flag.csa,
            VitaminAssets.Flag.cu,
            VitaminAssets.Flag.cv,
            VitaminAssets.Flag.cy,
            VitaminAssets.Flag.cz,
            VitaminAssets.Flag.de,
            VitaminAssets.Flag.dj,
            VitaminAssets.Flag.dk,
            VitaminAssets.Flag.dm,
            VitaminAssets.Flag.do,
            VitaminAssets.Flag.dz,
            VitaminAssets.Flag.ec,
            VitaminAssets.Flag.ee,
            VitaminAssets.Flag.eg,
            VitaminAssets.Flag.er,
            VitaminAssets.Flag.es,
            VitaminAssets.Flag.et,
            VitaminAssets.Flag.eu,
            VitaminAssets.Flag.fi,
            VitaminAssets.Flag.fj,
            VitaminAssets.Flag.fk,
            VitaminAssets.Flag.fm,
            VitaminAssets.Flag.fr,
            VitaminAssets.Flag.ga,
            VitaminAssets.Flag.gb,
            VitaminAssets.Flag.gd,
            VitaminAssets.Flag.ge,
            VitaminAssets.Flag.gg,
            VitaminAssets.Flag.gh,
            VitaminAssets.Flag.gi,
            VitaminAssets.Flag.gm,
            VitaminAssets.Flag.gn,
            VitaminAssets.Flag.gq,
            VitaminAssets.Flag.gr,
            VitaminAssets.Flag.gt,
            VitaminAssets.Flag.gw,
            VitaminAssets.Flag.gy,
            VitaminAssets.Flag.hk,
            VitaminAssets.Flag.hn,
            VitaminAssets.Flag.hr,
            VitaminAssets.Flag.ht,
            VitaminAssets.Flag.hu,
            VitaminAssets.Flag.id,
            VitaminAssets.Flag.ie,
            VitaminAssets.Flag.il,
            VitaminAssets.Flag.im,
            VitaminAssets.Flag.in,
            VitaminAssets.Flag.iq,
            VitaminAssets.Flag.ir,
            VitaminAssets.Flag.is,
            VitaminAssets.Flag.it,
            VitaminAssets.Flag.je,
            VitaminAssets.Flag.jm,
            VitaminAssets.Flag.jo,
            VitaminAssets.Flag.jp,
            VitaminAssets.Flag.ke,
            VitaminAssets.Flag.kg,
            VitaminAssets.Flag.kh,
            VitaminAssets.Flag.km,
            VitaminAssets.Flag.kn,
            VitaminAssets.Flag.kp,
            VitaminAssets.Flag.kr,
            VitaminAssets.Flag.kw,
            VitaminAssets.Flag.ky,
            VitaminAssets.Flag.kz,
            VitaminAssets.Flag.la,
            VitaminAssets.Flag.lb,
            VitaminAssets.Flag.lc,
            VitaminAssets.Flag.li,
            VitaminAssets.Flag.lk,
            VitaminAssets.Flag.lr,
            VitaminAssets.Flag.ls,
            VitaminAssets.Flag.lt,
            VitaminAssets.Flag.lu,
            VitaminAssets.Flag.lv,
            VitaminAssets.Flag.ly,
            VitaminAssets.Flag.ma,
            VitaminAssets.Flag.mc,
            VitaminAssets.Flag.md,
            VitaminAssets.Flag.me,
            VitaminAssets.Flag.mg,
            VitaminAssets.Flag.mk,
            VitaminAssets.Flag.ml,
            VitaminAssets.Flag.mm,
            VitaminAssets.Flag.mn,
            VitaminAssets.Flag.mo,
            VitaminAssets.Flag.mr,
            VitaminAssets.Flag.ms,
            VitaminAssets.Flag.mt,
            VitaminAssets.Flag.mu,
            VitaminAssets.Flag.mv,
            VitaminAssets.Flag.mw,
            VitaminAssets.Flag.mx,
            VitaminAssets.Flag.my,
            VitaminAssets.Flag.mz,
            VitaminAssets.Flag.na,
            VitaminAssets.Flag.ne,
            VitaminAssets.Flag.ng,
            VitaminAssets.Flag.ni,
            VitaminAssets.Flag.nl,
            VitaminAssets.Flag.no,
            VitaminAssets.Flag.np,
            VitaminAssets.Flag.nz,
            VitaminAssets.Flag.om,
            VitaminAssets.Flag.pa,
            VitaminAssets.Flag.pe,
            VitaminAssets.Flag.pf,
            VitaminAssets.Flag.pg,
            VitaminAssets.Flag.ph,
            VitaminAssets.Flag.pk,
            VitaminAssets.Flag.pl,
            VitaminAssets.Flag.pr,
            VitaminAssets.Flag.pt,
            VitaminAssets.Flag.pw,
            VitaminAssets.Flag.py,
            VitaminAssets.Flag.qa,
            VitaminAssets.Flag.ro,
            VitaminAssets.Flag.rs,
            VitaminAssets.Flag.ru,
            VitaminAssets.Flag.rw,
            VitaminAssets.Flag.sa,
            VitaminAssets.Flag.sb,
            VitaminAssets.Flag.sc,
            VitaminAssets.Flag.sd,
            VitaminAssets.Flag.se,
            VitaminAssets.Flag.sg,
            VitaminAssets.Flag.sh,
            VitaminAssets.Flag.si,
            VitaminAssets.Flag.sk,
            VitaminAssets.Flag.sl,
            VitaminAssets.Flag.sm,
            VitaminAssets.Flag.sn,
            VitaminAssets.Flag.so,
            VitaminAssets.Flag.sr,
            VitaminAssets.Flag.st,
            VitaminAssets.Flag.sv,
            VitaminAssets.Flag.sy,
            VitaminAssets.Flag.sz,
            VitaminAssets.Flag.tc,
            VitaminAssets.Flag.td,
            VitaminAssets.Flag.tg,
            VitaminAssets.Flag.th,
            VitaminAssets.Flag.tj,
            VitaminAssets.Flag.tl,
            VitaminAssets.Flag.tm,
            VitaminAssets.Flag.tn,
            VitaminAssets.Flag.to,
            VitaminAssets.Flag.tr,
            VitaminAssets.Flag.tt,
            VitaminAssets.Flag.tw,
            VitaminAssets.Flag.tz,
            VitaminAssets.Flag.ua,
            VitaminAssets.Flag.ug,
            VitaminAssets.Flag.us,
            VitaminAssets.Flag.uy,
            VitaminAssets.Flag.uz,
            VitaminAssets.Flag.vc,
            VitaminAssets.Flag.ve,
            VitaminAssets.Flag.vg,
            VitaminAssets.Flag.vn,
            VitaminAssets.Flag.vu,
            VitaminAssets.Flag.ws,
            VitaminAssets.Flag.ww,
            VitaminAssets.Flag.ye,
            VitaminAssets.Flag.za,
            VitaminAssets.Flag.zm,
            VitaminAssets.Flag.zw
        ]),
        AssetsModel.Section(name: "Payment", items: [
            VitaminAssets.Payment.amazonPay,
            VitaminAssets.Payment.amex,
            VitaminAssets.Payment.applePay,
            VitaminAssets.Payment.bvr,
            VitaminAssets.Payment.bancontactPayconiq,
            VitaminAssets.Payment.bancontact,
            VitaminAssets.Payment.belfius,
            VitaminAssets.Payment.bitcoin,
            VitaminAssets.Payment.bitpay,
            VitaminAssets.Payment.cb,
            VitaminAssets.Payment.cadhoc,
            VitaminAssets.Payment.cash,
            VitaminAssets.Payment.clickandBuy,
            VitaminAssets.Payment.dinersClubInternational,
            VitaminAssets.Payment.discover,
            VitaminAssets.Payment.dwolla,
            VitaminAssets.Payment.eps,
            VitaminAssets.Payment.elo,
            VitaminAssets.Payment.eway,
            VitaminAssets.Payment.giroPay,
            VitaminAssets.Payment.googlePay,
            VitaminAssets.Payment.ing,
            VitaminAssets.Payment.illicado,
            VitaminAssets.Payment.ingenico,
            VitaminAssets.Payment.jcb,
            VitaminAssets.Payment.kbc,
            VitaminAssets.Payment.klarna,
            VitaminAssets.Payment.mbMultibanco,
            VitaminAssets.Payment.mbWay,
            VitaminAssets.Payment.mnp,
            VitaminAssets.Payment.maestroFull,
            VitaminAssets.Payment.maestro,
            VitaminAssets.Payment.masterCardIDCheck,
            VitaminAssets.Payment.mastercardFull,
            VitaminAssets.Payment.mastercard,
            VitaminAssets.Payment.neteller,
            VitaminAssets.Payment.oneyClassic,
            VitaminAssets.Payment.oney3x,
            VitaminAssets.Payment.oney3x4x,
            VitaminAssets.Payment.oney4x,
            VitaminAssets.Payment.payU,
            VitaminAssets.Payment.paylib,
            VitaminAssets.Payment.paymill,
            VitaminAssets.Payment.payoneer,
            VitaminAssets.Payment.paypal,
            VitaminAssets.Payment.paysafeCard,
            VitaminAssets.Payment.pointsPay,
            VitaminAssets.Payment.postFinanceCard,
            VitaminAssets.Payment.postFinanceEFinance,
            VitaminAssets.Payment.postePay,
            VitaminAssets.Payment.powerPay,
            VitaminAssets.Payment.przelewy24,
            VitaminAssets.Payment.sepa,
            VitaminAssets.Payment.skrill,
            VitaminAssets.Payment.spiritOfCadeau,
            VitaminAssets.Payment.stripe,
            VitaminAssets.Payment.unionPay,
            VitaminAssets.Payment.verifone,
            VitaminAssets.Payment.visaClassic,
            VitaminAssets.Payment.visaElectron,
            VitaminAssets.Payment.webMoney,
            VitaminAssets.Payment.westernUnion,
            VitaminAssets.Payment.iDeal,
            VitaminAssets.Payment.wallet,
            VitaminAssets.Payment.giftCardPayment,
            VitaminAssets.Payment.chequePayment
        ]),
        AssetsModel.Section(name: "Placeholders", items: [
            VitaminAssets.Placeholder.landscape
        ])
    ]
}
