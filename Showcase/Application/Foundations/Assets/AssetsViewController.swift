//
//  Vitamin iOS
//  Apache License 2.0
//

// swiftlint:disable file_length
import UIKit
import Vitamin

final class AssetsViewController: BaseImageCollectionViewController {
    convenience init() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionHeadersPinToVisibleBounds = false
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.estimatedItemSize = .zero
        self.init(collectionViewLayout: layout)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sections = makeSections()

        view.backgroundColor = VitaminColor.Core.Background.primary

        navigationItem.title = "Assets"
        collectionView.register(
            UINib(
                nibName: "AssetCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "asset")
        collectionView.register(
            UINib(
                nibName: "LargeAssetCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "largeAsset")

        collectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "header")

        if let flow = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flow.headerReferenceSize = CGSize(width: view.frame.width, height: 55)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension AssetsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let defaultSize = CGSize(width: view.frame.width / 5, height: 90)
        guard
            let assetItem = sections[indexPath.section].items[indexPath.row] as? AssetItem
        else {
            return defaultSize
        }
        switch assetItem.type {
        case .large:
            return CGSize(width: view.frame.width, height: 110)
        case.medium:
            return CGSize(width: view.frame.width / 2.1, height: 90)
        case .standard:
            return defaultSize
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}

// MARK: - UICollectionViewDataSource
extension AssetsViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        sections[section].items.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let assetItem = sections[indexPath.section].items[indexPath.row] as? AssetItem else {
            return AssetCollectionViewCell()
        }
        let reuseId = (assetItem.type == .large ? "largeAsset" : "asset")
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseId,
            for: indexPath) as? AssetCollectionViewCell else {
                    return AssetCollectionViewCell()
                }

        cell.setImage(assetItem.image,
                      name: assetItem.shortName,
                      textColor: VitaminColor.Core.Content.primary)
        return cell
    }
}

// MARK: - private structs and functions
extension AssetsViewController {
    private struct AssetSection: BaseImageSection {
        let name: String
        let items: [BaseImageItem]
    }

    private struct AssetItem: BaseImageItem {
        let name: String
        let image: UIImage
        var type: AssetItemType = .standard

        var shortName: String {
            let components = name.components(separatedBy: ".")
            if components.count >= 3 {
                return components[2]
            }
            return name
        }
    }

    private enum AssetItemType {
        case large, medium, standard
    }

    // swiftlint:disable function_body_length
    private func makeSections() -> [AssetSection] {
        [
            AssetSection(name: "Logos", items: [
                AssetItem(name: "VitaminAssets.Logo.logo.image",
                          image: VitaminAssets.Logo.logo.image,
                          type: .large),
                AssetItem(name: "VitaminAssets.Logo.logoOutlined.image",
                          image: VitaminAssets.Logo.logoOutlined.image,
                          type: .large),
                AssetItem(name: "VitaminAssets.Logo.favicon.image",
                          image: VitaminAssets.Logo.favicon.image,
                          type: .medium),
                AssetItem(name: "VitaminAssets.Logo.faviconBlack.image",
                          image: VitaminAssets.Logo.faviconBlack.image,
                          type: .medium)
            ]),
            AssetSection(name: "Flags", items: [
                AssetItem(name: "VitaminAssets.Flag.ae.image", image: VitaminAssets.Flag.ae.image),
                AssetItem(name: "VitaminAssets.Flag.af.image", image: VitaminAssets.Flag.af.image),
                AssetItem(name: "VitaminAssets.Flag.ag.image", image: VitaminAssets.Flag.ag.image),
                AssetItem(name: "VitaminAssets.Flag.ai.image", image: VitaminAssets.Flag.ai.image),
                AssetItem(name: "VitaminAssets.Flag.al.image", image: VitaminAssets.Flag.al.image),
                AssetItem(name: "VitaminAssets.Flag.am.image", image: VitaminAssets.Flag.am.image),
                AssetItem(name: "VitaminAssets.Flag.an.image", image: VitaminAssets.Flag.an.image),
                AssetItem(name: "VitaminAssets.Flag.ao.image", image: VitaminAssets.Flag.ao.image),
                AssetItem(name: "VitaminAssets.Flag.ar.image", image: VitaminAssets.Flag.ar.image),
                AssetItem(name: "VitaminAssets.Flag.at.image", image: VitaminAssets.Flag.at.image),
                AssetItem(name: "VitaminAssets.Flag.ad.image", image: VitaminAssets.Flag.ad.image),
                AssetItem(name: "VitaminAssets.Flag.au.image", image: VitaminAssets.Flag.au.image),
                AssetItem(name: "VitaminAssets.Flag.aw.image", image: VitaminAssets.Flag.aw.image),
                AssetItem(name: "VitaminAssets.Flag.ax.image", image: VitaminAssets.Flag.ax.image),
                AssetItem(name: "VitaminAssets.Flag.az.image", image: VitaminAssets.Flag.az.image),
                AssetItem(name: "VitaminAssets.Flag.ba.image", image: VitaminAssets.Flag.ba.image),
                AssetItem(name: "VitaminAssets.Flag.bb.image", image: VitaminAssets.Flag.bb.image),
                AssetItem(name: "VitaminAssets.Flag.bd.image", image: VitaminAssets.Flag.bd.image),
                AssetItem(name: "VitaminAssets.Flag.be.image", image: VitaminAssets.Flag.be.image),
                AssetItem(name: "VitaminAssets.Flag.bf.image", image: VitaminAssets.Flag.bf.image),
                AssetItem(name: "VitaminAssets.Flag.bg.image", image: VitaminAssets.Flag.bg.image),
                AssetItem(name: "VitaminAssets.Flag.bh.image", image: VitaminAssets.Flag.bh.image),
                AssetItem(name: "VitaminAssets.Flag.bi.image", image: VitaminAssets.Flag.bi.image),
                AssetItem(name: "VitaminAssets.Flag.bj.image", image: VitaminAssets.Flag.bj.image),
                AssetItem(name: "VitaminAssets.Flag.bm.image", image: VitaminAssets.Flag.bm.image),
                AssetItem(name: "VitaminAssets.Flag.bn.image", image: VitaminAssets.Flag.bn.image),
                AssetItem(name: "VitaminAssets.Flag.bo.image", image: VitaminAssets.Flag.bo.image),
                AssetItem(name: "VitaminAssets.Flag.br.image", image: VitaminAssets.Flag.br.image),
                AssetItem(name: "VitaminAssets.Flag.bs.image", image: VitaminAssets.Flag.bs.image),
                AssetItem(name: "VitaminAssets.Flag.bt.image", image: VitaminAssets.Flag.bt.image),
                AssetItem(name: "VitaminAssets.Flag.bw.image", image: VitaminAssets.Flag.bw.image),
                AssetItem(name: "VitaminAssets.Flag.by.image", image: VitaminAssets.Flag.by.image),
                AssetItem(name: "VitaminAssets.Flag.bz.image", image: VitaminAssets.Flag.bz.image),
                AssetItem(name: "VitaminAssets.Flag.ca.image", image: VitaminAssets.Flag.ca.image),
                AssetItem(name: "VitaminAssets.Flag.caf.image", image: VitaminAssets.Flag.caf.image),
                AssetItem(name: "VitaminAssets.Flag.cas.image", image: VitaminAssets.Flag.cas.image),
                AssetItem(name: "VitaminAssets.Flag.cd.image", image: VitaminAssets.Flag.cd.image),
                AssetItem(name: "VitaminAssets.Flag.ceu.image", image: VitaminAssets.Flag.ceu.image),
                AssetItem(name: "VitaminAssets.Flag.cf.image", image: VitaminAssets.Flag.cf.image),
                AssetItem(name: "VitaminAssets.Flag.cg.image", image: VitaminAssets.Flag.cg.image),
                AssetItem(name: "VitaminAssets.Flag.ch.image", image: VitaminAssets.Flag.ch.image),
                AssetItem(name: "VitaminAssets.Flag.ci.image", image: VitaminAssets.Flag.ci.image),
                AssetItem(name: "VitaminAssets.Flag.cl.image", image: VitaminAssets.Flag.cl.image),
                AssetItem(name: "VitaminAssets.Flag.cm.image", image: VitaminAssets.Flag.cm.image),
                AssetItem(name: "VitaminAssets.Flag.cn.image", image: VitaminAssets.Flag.cn.image),
                AssetItem(name: "VitaminAssets.Flag.cna.image", image: VitaminAssets.Flag.cna.image),
                AssetItem(name: "VitaminAssets.Flag.co.image", image: VitaminAssets.Flag.co.image),
                AssetItem(name: "VitaminAssets.Flag.coc.image", image: VitaminAssets.Flag.coc.image),
                AssetItem(name: "VitaminAssets.Flag.cr.image", image: VitaminAssets.Flag.cr.image),
                AssetItem(name: "VitaminAssets.Flag.csa.image", image: VitaminAssets.Flag.csa.image),
                AssetItem(name: "VitaminAssets.Flag.cu.image", image: VitaminAssets.Flag.cu.image),
                AssetItem(name: "VitaminAssets.Flag.cv.image", image: VitaminAssets.Flag.cv.image),
                AssetItem(name: "VitaminAssets.Flag.cy.image", image: VitaminAssets.Flag.cy.image),
                AssetItem(name: "VitaminAssets.Flag.cz.image", image: VitaminAssets.Flag.cz.image),
                AssetItem(name: "VitaminAssets.Flag.de.image", image: VitaminAssets.Flag.de.image),
                AssetItem(name: "VitaminAssets.Flag.dj.image", image: VitaminAssets.Flag.dj.image),
                AssetItem(name: "VitaminAssets.Flag.dk.image", image: VitaminAssets.Flag.dk.image),
                AssetItem(name: "VitaminAssets.Flag.dm.image", image: VitaminAssets.Flag.dm.image),
                AssetItem(name: "VitaminAssets.Flag.dom.image", image: VitaminAssets.Flag.dom.image),
                AssetItem(name: "VitaminAssets.Flag.dz.image", image: VitaminAssets.Flag.dz.image),
                AssetItem(name: "VitaminAssets.Flag.ec.image", image: VitaminAssets.Flag.ec.image),
                AssetItem(name: "VitaminAssets.Flag.ee.image", image: VitaminAssets.Flag.ee.image),
                AssetItem(name: "VitaminAssets.Flag.eg.image", image: VitaminAssets.Flag.eg.image),
                AssetItem(name: "VitaminAssets.Flag.er.image", image: VitaminAssets.Flag.er.image),
                AssetItem(name: "VitaminAssets.Flag.es.image", image: VitaminAssets.Flag.es.image),
                AssetItem(name: "VitaminAssets.Flag.et.image", image: VitaminAssets.Flag.et.image),
                AssetItem(name: "VitaminAssets.Flag.eu.image", image: VitaminAssets.Flag.eu.image),
                AssetItem(name: "VitaminAssets.Flag.fi.image", image: VitaminAssets.Flag.fi.image),
                AssetItem(name: "VitaminAssets.Flag.fj.image", image: VitaminAssets.Flag.fj.image),
                AssetItem(name: "VitaminAssets.Flag.fk.image", image: VitaminAssets.Flag.fk.image),
                AssetItem(name: "VitaminAssets.Flag.fm.image", image: VitaminAssets.Flag.fm.image),
                AssetItem(name: "VitaminAssets.Flag.fr.image", image: VitaminAssets.Flag.fr.image),
                AssetItem(name: "VitaminAssets.Flag.ga.image", image: VitaminAssets.Flag.ga.image),
                AssetItem(name: "VitaminAssets.Flag.gb.image", image: VitaminAssets.Flag.gb.image),
                AssetItem(name: "VitaminAssets.Flag.gd.image", image: VitaminAssets.Flag.gd.image),
                AssetItem(name: "VitaminAssets.Flag.ge.image", image: VitaminAssets.Flag.ge.image),
                AssetItem(name: "VitaminAssets.Flag.gg.image", image: VitaminAssets.Flag.gg.image),
                AssetItem(name: "VitaminAssets.Flag.gh.image", image: VitaminAssets.Flag.gh.image),
                AssetItem(name: "VitaminAssets.Flag.gi.image", image: VitaminAssets.Flag.gi.image),
                AssetItem(name: "VitaminAssets.Flag.gm.image", image: VitaminAssets.Flag.gm.image),
                AssetItem(name: "VitaminAssets.Flag.gn.image", image: VitaminAssets.Flag.gn.image),
                AssetItem(name: "VitaminAssets.Flag.gq.image", image: VitaminAssets.Flag.gq.image),
                AssetItem(name: "VitaminAssets.Flag.gr.image", image: VitaminAssets.Flag.gr.image),
                AssetItem(name: "VitaminAssets.Flag.gt.image", image: VitaminAssets.Flag.gt.image),
                AssetItem(name: "VitaminAssets.Flag.gw.image", image: VitaminAssets.Flag.gw.image),
                AssetItem(name: "VitaminAssets.Flag.gy.image", image: VitaminAssets.Flag.gy.image),
                AssetItem(name: "VitaminAssets.Flag.hk.image", image: VitaminAssets.Flag.hk.image),
                AssetItem(name: "VitaminAssets.Flag.hn.image", image: VitaminAssets.Flag.hn.image),
                AssetItem(name: "VitaminAssets.Flag.hr.image", image: VitaminAssets.Flag.hr.image),
                AssetItem(name: "VitaminAssets.Flag.ht.image", image: VitaminAssets.Flag.ht.image),
                AssetItem(name: "VitaminAssets.Flag.hu.image", image: VitaminAssets.Flag.hu.image),
                AssetItem(name: "VitaminAssets.Flag.id.image", image: VitaminAssets.Flag.id.image),
                AssetItem(name: "VitaminAssets.Flag.ie.image", image: VitaminAssets.Flag.ie.image),
                AssetItem(name: "VitaminAssets.Flag.il.image", image: VitaminAssets.Flag.il.image),
                AssetItem(name: "VitaminAssets.Flag.im.image", image: VitaminAssets.Flag.im.image),
                AssetItem(name: "VitaminAssets.Flag.ind.image", image: VitaminAssets.Flag.ind.image),
                AssetItem(name: "VitaminAssets.Flag.iq.image", image: VitaminAssets.Flag.iq.image),
                AssetItem(name: "VitaminAssets.Flag.ir.image", image: VitaminAssets.Flag.ir.image),
                AssetItem(name: "VitaminAssets.Flag.isl.image", image: VitaminAssets.Flag.isl.image),
                AssetItem(name: "VitaminAssets.Flag.it.image", image: VitaminAssets.Flag.it.image),
                AssetItem(name: "VitaminAssets.Flag.je.image", image: VitaminAssets.Flag.je.image),
                AssetItem(name: "VitaminAssets.Flag.jm.image", image: VitaminAssets.Flag.jm.image),
                AssetItem(name: "VitaminAssets.Flag.jo.image", image: VitaminAssets.Flag.jo.image),
                AssetItem(name: "VitaminAssets.Flag.jp.image", image: VitaminAssets.Flag.jp.image),
                AssetItem(name: "VitaminAssets.Flag.ke.image", image: VitaminAssets.Flag.ke.image),
                AssetItem(name: "VitaminAssets.Flag.kg.image", image: VitaminAssets.Flag.kg.image),
                AssetItem(name: "VitaminAssets.Flag.kh.image", image: VitaminAssets.Flag.kh.image),
                AssetItem(name: "VitaminAssets.Flag.km.image", image: VitaminAssets.Flag.km.image),
                AssetItem(name: "VitaminAssets.Flag.kn.image", image: VitaminAssets.Flag.kn.image),
                AssetItem(name: "VitaminAssets.Flag.kp.image", image: VitaminAssets.Flag.kp.image),
                AssetItem(name: "VitaminAssets.Flag.kr.image", image: VitaminAssets.Flag.kr.image),
                AssetItem(name: "VitaminAssets.Flag.kw.image", image: VitaminAssets.Flag.kw.image),
                AssetItem(name: "VitaminAssets.Flag.ky.image", image: VitaminAssets.Flag.ky.image),
                AssetItem(name: "VitaminAssets.Flag.kz.image", image: VitaminAssets.Flag.kz.image),
                AssetItem(name: "VitaminAssets.Flag.la.image", image: VitaminAssets.Flag.la.image),
                AssetItem(name: "VitaminAssets.Flag.lb.image", image: VitaminAssets.Flag.lb.image),
                AssetItem(name: "VitaminAssets.Flag.lc.image", image: VitaminAssets.Flag.lc.image),
                AssetItem(name: "VitaminAssets.Flag.li.image", image: VitaminAssets.Flag.li.image),
                AssetItem(name: "VitaminAssets.Flag.lk.image", image: VitaminAssets.Flag.lk.image),
                AssetItem(name: "VitaminAssets.Flag.lr.image", image: VitaminAssets.Flag.lr.image),
                AssetItem(name: "VitaminAssets.Flag.ls.image", image: VitaminAssets.Flag.ls.image),
                AssetItem(name: "VitaminAssets.Flag.lt.image", image: VitaminAssets.Flag.lt.image),
                AssetItem(name: "VitaminAssets.Flag.lu.image", image: VitaminAssets.Flag.lu.image),
                AssetItem(name: "VitaminAssets.Flag.lv.image", image: VitaminAssets.Flag.lv.image),
                AssetItem(name: "VitaminAssets.Flag.ly.image", image: VitaminAssets.Flag.ly.image),
                AssetItem(name: "VitaminAssets.Flag.ma.image", image: VitaminAssets.Flag.ma.image),
                AssetItem(name: "VitaminAssets.Flag.mc.image", image: VitaminAssets.Flag.mc.image),
                AssetItem(name: "VitaminAssets.Flag.md.image", image: VitaminAssets.Flag.md.image),
                AssetItem(name: "VitaminAssets.Flag.me.image", image: VitaminAssets.Flag.me.image),
                AssetItem(name: "VitaminAssets.Flag.mg.image", image: VitaminAssets.Flag.mg.image),
                AssetItem(name: "VitaminAssets.Flag.mk.image", image: VitaminAssets.Flag.mk.image),
                AssetItem(name: "VitaminAssets.Flag.ml.image", image: VitaminAssets.Flag.ml.image),
                AssetItem(name: "VitaminAssets.Flag.mm.image", image: VitaminAssets.Flag.mm.image),
                AssetItem(name: "VitaminAssets.Flag.mn.image", image: VitaminAssets.Flag.mn.image),
                AssetItem(name: "VitaminAssets.Flag.mo.image", image: VitaminAssets.Flag.mo.image),
                AssetItem(name: "VitaminAssets.Flag.mr.image", image: VitaminAssets.Flag.mr.image),
                AssetItem(name: "VitaminAssets.Flag.ms.image", image: VitaminAssets.Flag.ms.image),
                AssetItem(name: "VitaminAssets.Flag.mt.image", image: VitaminAssets.Flag.mt.image),
                AssetItem(name: "VitaminAssets.Flag.mu.image", image: VitaminAssets.Flag.mu.image),
                AssetItem(name: "VitaminAssets.Flag.mv.image", image: VitaminAssets.Flag.mv.image),
                AssetItem(name: "VitaminAssets.Flag.mw.image", image: VitaminAssets.Flag.mw.image),
                AssetItem(name: "VitaminAssets.Flag.mx.image", image: VitaminAssets.Flag.mx.image),
                AssetItem(name: "VitaminAssets.Flag.my.image", image: VitaminAssets.Flag.my.image),
                AssetItem(name: "VitaminAssets.Flag.mz.image", image: VitaminAssets.Flag.mz.image),
                AssetItem(name: "VitaminAssets.Flag.na.image", image: VitaminAssets.Flag.na.image),
                AssetItem(name: "VitaminAssets.Flag.ne.image", image: VitaminAssets.Flag.ne.image),
                AssetItem(name: "VitaminAssets.Flag.ng.image", image: VitaminAssets.Flag.ng.image),
                AssetItem(name: "VitaminAssets.Flag.ni.image", image: VitaminAssets.Flag.ni.image),
                AssetItem(name: "VitaminAssets.Flag.nl.image", image: VitaminAssets.Flag.nl.image),
                AssetItem(name: "VitaminAssets.Flag.no.image", image: VitaminAssets.Flag.no.image),
                AssetItem(name: "VitaminAssets.Flag.np.image", image: VitaminAssets.Flag.np.image),
                AssetItem(name: "VitaminAssets.Flag.nz.image", image: VitaminAssets.Flag.nz.image),
                AssetItem(name: "VitaminAssets.Flag.om.image", image: VitaminAssets.Flag.om.image),
                AssetItem(name: "VitaminAssets.Flag.pa.image", image: VitaminAssets.Flag.pa.image),
                AssetItem(name: "VitaminAssets.Flag.pe.image", image: VitaminAssets.Flag.pe.image),
                AssetItem(name: "VitaminAssets.Flag.pf.image", image: VitaminAssets.Flag.pf.image),
                AssetItem(name: "VitaminAssets.Flag.pg.image", image: VitaminAssets.Flag.pg.image),
                AssetItem(name: "VitaminAssets.Flag.ph.image", image: VitaminAssets.Flag.ph.image),
                AssetItem(name: "VitaminAssets.Flag.pk.image", image: VitaminAssets.Flag.pk.image),
                AssetItem(name: "VitaminAssets.Flag.pl.image", image: VitaminAssets.Flag.pl.image),
                AssetItem(name: "VitaminAssets.Flag.pr.image", image: VitaminAssets.Flag.pr.image),
                AssetItem(name: "VitaminAssets.Flag.pt.image", image: VitaminAssets.Flag.pt.image),
                AssetItem(name: "VitaminAssets.Flag.pw.image", image: VitaminAssets.Flag.pw.image),
                AssetItem(name: "VitaminAssets.Flag.py.image", image: VitaminAssets.Flag.py.image),
                AssetItem(name: "VitaminAssets.Flag.qa.image", image: VitaminAssets.Flag.qa.image),
                AssetItem(name: "VitaminAssets.Flag.ro.image", image: VitaminAssets.Flag.ro.image),
                AssetItem(name: "VitaminAssets.Flag.rs.image", image: VitaminAssets.Flag.rs.image),
                AssetItem(name: "VitaminAssets.Flag.ru.image", image: VitaminAssets.Flag.ru.image),
                AssetItem(name: "VitaminAssets.Flag.rw.image", image: VitaminAssets.Flag.rw.image),
                AssetItem(name: "VitaminAssets.Flag.sa.image", image: VitaminAssets.Flag.sa.image),
                AssetItem(name: "VitaminAssets.Flag.sb.image", image: VitaminAssets.Flag.sb.image),
                AssetItem(name: "VitaminAssets.Flag.sc.image", image: VitaminAssets.Flag.sc.image),
                AssetItem(name: "VitaminAssets.Flag.sd.image", image: VitaminAssets.Flag.sd.image),
                AssetItem(name: "VitaminAssets.Flag.se.image", image: VitaminAssets.Flag.se.image),
                AssetItem(name: "VitaminAssets.Flag.sg.image", image: VitaminAssets.Flag.sg.image),
                AssetItem(name: "VitaminAssets.Flag.sh.image", image: VitaminAssets.Flag.sh.image),
                AssetItem(name: "VitaminAssets.Flag.si.image", image: VitaminAssets.Flag.si.image),
                AssetItem(name: "VitaminAssets.Flag.sk.image", image: VitaminAssets.Flag.sk.image),
                AssetItem(name: "VitaminAssets.Flag.sl.image", image: VitaminAssets.Flag.sl.image),
                AssetItem(name: "VitaminAssets.Flag.sm.image", image: VitaminAssets.Flag.sm.image),
                AssetItem(name: "VitaminAssets.Flag.sn.image", image: VitaminAssets.Flag.sn.image),
                AssetItem(name: "VitaminAssets.Flag.so.image", image: VitaminAssets.Flag.so.image),
                AssetItem(name: "VitaminAssets.Flag.sr.image", image: VitaminAssets.Flag.sr.image),
                AssetItem(name: "VitaminAssets.Flag.st.image", image: VitaminAssets.Flag.st.image),
                AssetItem(name: "VitaminAssets.Flag.sv.image", image: VitaminAssets.Flag.sv.image),
                AssetItem(name: "VitaminAssets.Flag.sy.image", image: VitaminAssets.Flag.sy.image),
                AssetItem(name: "VitaminAssets.Flag.sz.image", image: VitaminAssets.Flag.sz.image),
                AssetItem(name: "VitaminAssets.Flag.tc.image", image: VitaminAssets.Flag.tc.image),
                AssetItem(name: "VitaminAssets.Flag.td.image", image: VitaminAssets.Flag.td.image),
                AssetItem(name: "VitaminAssets.Flag.tg.image", image: VitaminAssets.Flag.tg.image),
                AssetItem(name: "VitaminAssets.Flag.th.image", image: VitaminAssets.Flag.th.image),
                AssetItem(name: "VitaminAssets.Flag.tj.image", image: VitaminAssets.Flag.tj.image),
                AssetItem(name: "VitaminAssets.Flag.tl.image", image: VitaminAssets.Flag.tl.image),
                AssetItem(name: "VitaminAssets.Flag.tm.image", image: VitaminAssets.Flag.tm.image),
                AssetItem(name: "VitaminAssets.Flag.tn.image", image: VitaminAssets.Flag.tn.image),
                AssetItem(name: "VitaminAssets.Flag.to.image", image: VitaminAssets.Flag.to.image),
                AssetItem(name: "VitaminAssets.Flag.tr.image", image: VitaminAssets.Flag.tr.image),
                AssetItem(name: "VitaminAssets.Flag.tt.image", image: VitaminAssets.Flag.tt.image),
                AssetItem(name: "VitaminAssets.Flag.tw.image", image: VitaminAssets.Flag.tw.image),
                AssetItem(name: "VitaminAssets.Flag.tz.image", image: VitaminAssets.Flag.tz.image),
                AssetItem(name: "VitaminAssets.Flag.ua.image", image: VitaminAssets.Flag.ua.image),
                AssetItem(name: "VitaminAssets.Flag.ug.image", image: VitaminAssets.Flag.ug.image),
                AssetItem(name: "VitaminAssets.Flag.us.image", image: VitaminAssets.Flag.us.image),
                AssetItem(name: "VitaminAssets.Flag.uy.image", image: VitaminAssets.Flag.uy.image),
                AssetItem(name: "VitaminAssets.Flag.uz.image", image: VitaminAssets.Flag.uz.image),
                AssetItem(name: "VitaminAssets.Flag.vc.image", image: VitaminAssets.Flag.vc.image),
                AssetItem(name: "VitaminAssets.Flag.ve.image", image: VitaminAssets.Flag.ve.image),
                AssetItem(name: "VitaminAssets.Flag.vg.image", image: VitaminAssets.Flag.vg.image),
                AssetItem(name: "VitaminAssets.Flag.vn.image", image: VitaminAssets.Flag.vn.image),
                AssetItem(name: "VitaminAssets.Flag.vu.image", image: VitaminAssets.Flag.vu.image),
                AssetItem(name: "VitaminAssets.Flag.ws.image", image: VitaminAssets.Flag.ws.image),
                AssetItem(name: "VitaminAssets.Flag.ww.image", image: VitaminAssets.Flag.ww.image),
                AssetItem(name: "VitaminAssets.Flag.ye.image", image: VitaminAssets.Flag.ye.image),
                AssetItem(name: "VitaminAssets.Flag.za.image", image: VitaminAssets.Flag.za.image),
                AssetItem(name: "VitaminAssets.Flag.zm.image", image: VitaminAssets.Flag.zm.image),
                AssetItem(name: "VitaminAssets.Flag.zw.image", image: VitaminAssets.Flag.zw.image)
            ]),
            AssetSection(name: "Payment", items: [
                AssetItem(name: "VitaminAssets.Payment.amazonPay.image", image: VitaminAssets.Payment.amazonPay.image),
                AssetItem(name: "VitaminAssets.Payment.amex.image", image: VitaminAssets.Payment.amex.image),
                AssetItem(name: "VitaminAssets.Payment.applePay.image", image: VitaminAssets.Payment.applePay.image),
                AssetItem(name: "VitaminAssets.Payment.bvr.image", image: VitaminAssets.Payment.bvr.image),
                AssetItem(name: "VitaminAssets.Payment.bancontactPayconiq.image",
                          image: VitaminAssets.Payment.bancontactPayconiq.image),
                AssetItem(name: "VitaminAssets.Payment.bancontact.image",
                          image: VitaminAssets.Payment.bancontact.image),
                AssetItem(name: "VitaminAssets.Payment.belfius.image", image: VitaminAssets.Payment.belfius.image),
                AssetItem(name: "VitaminAssets.Payment.bitcoin.image", image: VitaminAssets.Payment.bitcoin.image),
                AssetItem(name: "VitaminAssets.Payment.bitpay.image", image: VitaminAssets.Payment.bitpay.image),
                AssetItem(name: "VitaminAssets.Payment.cb.image", image: VitaminAssets.Payment.cb.image),
                AssetItem(name: "VitaminAssets.Payment.cadhoc.image", image: VitaminAssets.Payment.cadhoc.image),
                AssetItem(name: "VitaminAssets.Payment.cash.image", image: VitaminAssets.Payment.cash.image),
                AssetItem(name: "VitaminAssets.Payment.clickandBuy.image",
                          image: VitaminAssets.Payment.clickandBuy.image),
                AssetItem(name: "VitaminAssets.Payment.dinersClubInternational.image",
                          image: VitaminAssets.Payment.dinersClubInternational.image),
                AssetItem(name: "VitaminAssets.Payment.discover.image", image: VitaminAssets.Payment.discover.image),
                AssetItem(name: "VitaminAssets.Payment.dwolla.image", image: VitaminAssets.Payment.dwolla.image),
                AssetItem(name: "VitaminAssets.Payment.eps.image", image: VitaminAssets.Payment.eps.image),
                AssetItem(name: "VitaminAssets.Payment.elo.image", image: VitaminAssets.Payment.elo.image),
                AssetItem(name: "VitaminAssets.Payment.eway.image", image: VitaminAssets.Payment.eway.image),
                AssetItem(name: "VitaminAssets.Payment.giroPay.image", image: VitaminAssets.Payment.giroPay.image),
                AssetItem(name: "VitaminAssets.Payment.googlePay.image", image: VitaminAssets.Payment.googlePay.image),
                AssetItem(name: "VitaminAssets.Payment.ing.image", image: VitaminAssets.Payment.ing.image),
                AssetItem(name: "VitaminAssets.Payment.illicado.image", image: VitaminAssets.Payment.illicado.image),
                AssetItem(name: "VitaminAssets.Payment.ingenico.image", image: VitaminAssets.Payment.ingenico.image),
                AssetItem(name: "VitaminAssets.Payment.jcb.image", image: VitaminAssets.Payment.jcb.image),
                AssetItem(name: "VitaminAssets.Payment.kbc.image", image: VitaminAssets.Payment.kbc.image),
                AssetItem(name: "VitaminAssets.Payment.klarna.image", image: VitaminAssets.Payment.klarna.image),
                AssetItem(name: "VitaminAssets.Payment.mbMultibanco.image",
                          image: VitaminAssets.Payment.mbMultibanco.image),
                AssetItem(name: "VitaminAssets.Payment.mbWay.image", image: VitaminAssets.Payment.mbWay.image),
                AssetItem(name: "VitaminAssets.Payment.mnp.image", image: VitaminAssets.Payment.mnp.image),
                AssetItem(name: "VitaminAssets.Payment.maestroFull.image",
                          image: VitaminAssets.Payment.maestroFull.image),
                AssetItem(name: "VitaminAssets.Payment.maestro.image", image: VitaminAssets.Payment.maestro.image),
                AssetItem(name: "VitaminAssets.Payment.masterCardIDCheck.image",
                          image: VitaminAssets.Payment.masterCardIDCheck.image),
                AssetItem(name: "VitaminAssets.Payment.mastercardFull.image",
                          image: VitaminAssets.Payment.mastercardFull.image),
                AssetItem(name: "VitaminAssets.Payment.mastercard.image",
                          image: VitaminAssets.Payment.mastercard.image),
                AssetItem(name: "VitaminAssets.Payment.neteller.image", image: VitaminAssets.Payment.neteller.image),
                AssetItem(name: "VitaminAssets.Payment.oneyClassic.image",
                          image: VitaminAssets.Payment.oneyClassic.image),
                AssetItem(name: "VitaminAssets.Payment.oney3x.image", image: VitaminAssets.Payment.oney3x.image),
                AssetItem(name: "VitaminAssets.Payment.oney3x4x.image", image: VitaminAssets.Payment.oney3x4x.image),
                AssetItem(name: "VitaminAssets.Payment.oney4x.image", image: VitaminAssets.Payment.oney4x.image),
                AssetItem(name: "VitaminAssets.Payment.payU.image", image: VitaminAssets.Payment.payU.image),
                AssetItem(name: "VitaminAssets.Payment.paylib.image", image: VitaminAssets.Payment.paylib.image),
                AssetItem(name: "VitaminAssets.Payment.paymill.image", image: VitaminAssets.Payment.paymill.image),
                AssetItem(name: "VitaminAssets.Payment.payoneer.image", image: VitaminAssets.Payment.payoneer.image),
                AssetItem(name: "VitaminAssets.Payment.paypal.image", image: VitaminAssets.Payment.paypal.image),
                AssetItem(name: "VitaminAssets.Payment.paysafeCard.image",
                          image: VitaminAssets.Payment.paysafeCard.image),
                AssetItem(name: "VitaminAssets.Payment.pointsPay.image",
                          image: VitaminAssets.Payment.pointsPay.image),
                AssetItem(name: "VitaminAssets.Payment.postFinanceCard.image",
                          image: VitaminAssets.Payment.postFinanceCard.image),
                AssetItem(name: "VitaminAssets.Payment.postFinanceEFinance.image",
                          image: VitaminAssets.Payment.postFinanceEFinance.image),
                AssetItem(name: "VitaminAssets.Payment.postePay.image", image: VitaminAssets.Payment.postePay.image),
                AssetItem(name: "VitaminAssets.Payment.powerPay.image", image: VitaminAssets.Payment.powerPay.image),
                AssetItem(name: "VitaminAssets.Payment.przelewy24.image",
                          image: VitaminAssets.Payment.przelewy24.image),
                AssetItem(name: "VitaminAssets.Payment.sepa.image", image: VitaminAssets.Payment.sepa.image),
                AssetItem(name: "VitaminAssets.Payment.skrill.image", image: VitaminAssets.Payment.skrill.image),
                AssetItem(name: "VitaminAssets.Payment.spiritOfCadeau.image",
                          image: VitaminAssets.Payment.spiritOfCadeau.image),
                AssetItem(name: "VitaminAssets.Payment.stripe.image", image: VitaminAssets.Payment.stripe.image),
                AssetItem(name: "VitaminAssets.Payment.unionPay.image", image: VitaminAssets.Payment.unionPay.image),
                AssetItem(name: "VitaminAssets.Payment.verifone.image", image: VitaminAssets.Payment.verifone.image),
                AssetItem(name: "VitaminAssets.Payment.visaClassic.image",
                          image: VitaminAssets.Payment.visaClassic.image),
                AssetItem(name: "VitaminAssets.Payment.visaElectron.image",
                          image: VitaminAssets.Payment.visaElectron.image),
                AssetItem(name: "VitaminAssets.Payment.webMoney.image", image: VitaminAssets.Payment.webMoney.image),
                AssetItem(name: "VitaminAssets.Payment.westernUnion.image",
                          image: VitaminAssets.Payment.westernUnion.image),
                AssetItem(name: "VitaminAssets.Payment.iDeal.image", image: VitaminAssets.Payment.iDeal.image)
            ]),
            AssetSection(name: "Placeholders", items: [
                AssetItem(name: "VitaminAssets.Placeholder.landscape.image",
                          image: VitaminAssets.Placeholder.landscape.image)
            ])
        ]
    }
}
