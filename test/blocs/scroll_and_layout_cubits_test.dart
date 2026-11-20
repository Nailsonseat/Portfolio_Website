import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_website/blocs/home/scroll_to_top_cubit.dart';
import 'package:portfolio_website/blocs/project_page/section_layout_cubit.dart';
import 'package:portfolio_website/blocs/project_page/table_of_contents_offset_cubit.dart';

void main() {
  group('ScrollToTopCubit', () {
    blocTest<ScrollToTopCubit, bool>(
      'only emits when visibility flips',
      build: ScrollToTopCubit.new,
      act: (cubit) => cubit
        ..onScrolled(10)
        ..onScrolled(150)
        ..onScrolled(300)
        ..onScrolled(99),
      expect: () => const [true, false],
    );
  });

  group('TableOfContentsOffsetCubit', () {
    blocTest<TableOfContentsOffsetCubit, double>(
      'stays at 0 above the banner and follows the scroll below it',
      build: TableOfContentsOffsetCubit.new,
      act: (cubit) => cubit
        ..onScrolled(offset: 500, bannerHeight: 1000)
        ..onScrolled(offset: 1030, bannerHeight: 1000)
        ..onScrolled(offset: 1200, bannerHeight: 1000)
        ..onScrolled(offset: 900, bannerHeight: 1000),
      // 1030 is past the banner but within the 50px gap, so it stays 0.
      expect: () => const [150.0, 0.0],
    );
  });

  group('SectionLayoutCubit', () {
    test('starts every section at the placeholder height', () {
      expect(
        SectionLayoutCubit(sectionCount: 3).state.heights,
        List.filled(3, SectionLayoutCubit.initialHeight),
      );
    });

    blocTest<SectionLayoutCubit, SectionLayoutState>(
      'keeps previous heights for unmeasured sections and skips no-op updates',
      build: () => SectionLayoutCubit(sectionCount: 3),
      act: (cubit) => cubit
        ..updateHeights([120, null, 300])
        ..updateHeights([120, null, 300])
        ..updateHeights([null, 80, null]),
      expect: () => const [
        SectionLayoutState(heights: [120, SectionLayoutCubit.initialHeight, 300]),
        SectionLayoutState(heights: [120, 80, 300]),
      ],
    );
  });
}
