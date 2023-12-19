# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="forceoptional"
PVCUT=$(ver_cut 1-3)
KFMIN=5.246.0
QTMIN=6.6.0
inherit ecm gear.kde.org

DESCRIPTION="Game based on anagrams of words"
HOMEPAGE="https://apps.kde.org/kanagram/ https://edu.kde.org/kanagram/"

LICENSE="GPL-2" # TODO: CHECK
SLOT="6"
KEYWORDS=""
IUSE="speech"

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[gui,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-apps/libkeduvocdocument-${PVCUT}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kconfigwidgets-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kcrash-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/knewstuff-${KFMIN}:6
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:6
	>=kde-frameworks/kxmlgui-${KFMIN}:6
	>=kde-frameworks/sonnet-${KFMIN}:6
	>=media-libs/phonon-4.12.0[qt6]
	speech? ( >=dev-qt/qtspeech-${QTMIN}:6 )
"
RDEPEND="${DEPEND}
	>=dev-qt/qtmultimedia-${QTMIN}:6[qml]
	>=kde-apps/kdeedu-data-${PVCUT}:6
"

src_configure() {
	local mycmakeargs=(
		$(cmake_use_find_package speech Qt6TextToSpeech)
	)

	ecm_src_configure
}
